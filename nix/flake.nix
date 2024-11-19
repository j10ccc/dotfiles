{
  description = "J10c nix-darwin system flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
  let
    configuration = { pkgs, ... }: {
      nixpkgs.config.allowUnfree = true;

      environment.systemPackages = [
        pkgs.neovim
        pkgs.fish
        pkgs.eza
        pkgs.zoxide
        pkgs.ripgrep
        pkgs.fd
        pkgs.lazygit
        pkgs.vivid
        pkgs.wezterm
        pkgs.obsidian
        pkgs.vscodium
        pkgs.localsend
      ];

      homebrew = {
        enable = true;
        casks = [
          "snipaste"
          "maccy"
          "iina"
          "eloston-chromium"
          "stats"
          "the-unarchiver"
          "telegram"
          "tencent-lemon"
        ];
        onActivation.cleanup = "zap";
      };

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#simple
    darwinConfigurations."jmba" = nix-darwin.lib.darwinSystem {
      modules = [ configuration ];
    };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."jmba".pkgs;
  };
}
