{ nixpkgs, inputs }:

name:
{ user }:

let
  hostConfig = ../hosts/${name};
  userOSConfig = ../users/${user};
  userHMConfig = ../users/${user}/home-manager.nix;

  systemFunc = inputs.nix-darwin.lib.darwinSystem;
  home-manager = inputs.home-manager.darwinModules;

in systemFunc rec {
  modules = [
    { 
      # Global system configuration
      nixpkgs.config.allowUnfree = true;
      nix.settings.experimental-features = "nix-command flakes";
      security.pam.services.sudo_local.touchIdAuth = true;
    }
    hostConfig
    userOSConfig
    home-manager.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = import userHMConfig;
    }
    inputs.nix-homebrew.darwinModules.nix-homebrew
    {
      nix-homebrew = {
        # Install Homebrew under the default prefix
        enable = true;
        enableRosetta = false;
        user = user;
        taps = {
          "homebrew/homebrew-core" = inputs.homebrew-core;
          "homebrew/homebrew-cask" = inputs.homebrew-cask;
        };
        # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
        mutableTaps = false;
      };
    }
  ];
}
