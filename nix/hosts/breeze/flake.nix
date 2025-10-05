{
  description = "Nix configuration for Breeze";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, nixpkgs, nix-homebrew
    , homebrew-core, homebrew-cask, }: {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations.Breeze = nix-darwin.lib.darwinSystem {
        modules = [
          ({ pkgs, ... }: {
            users.users.j10c = {
              name = "j10c";
              home = /Users/j10c;
              shell = pkgs.fish;
            };
          })
          ./configuration.nix
          nix-homebrew.darwinModules.nix-homebrew
          {
            nix-homebrew = {
              # Install Homebrew under the default prefix
              enable = true;
              enableRosetta = false;
              user = "j10c";
              taps = {
                "homebrew/homebrew-core" = homebrew-core;
                "homebrew/homebrew-cask" = homebrew-cask;
              };
              # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
              mutableTaps = false;
            };
          }
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.j10c = import ./home.nix;
            programs.fish.enable = true;
          }
          # Optional: Align homebrew taps config with nix-homebrew
          ({ config, ... }: {
            homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
          })
        ];
      };
    };
}
