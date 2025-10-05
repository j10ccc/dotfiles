{
  description = "Nix configuration for j10c's machines";

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
    , homebrew-core, homebrew-cask, }:
    let mkSystem = import ./lib/mksystem.nix { inherit nixpkgs inputs; };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations.Breeze = mkSystem "breeze" { user = "j10c"; };
    };
}
