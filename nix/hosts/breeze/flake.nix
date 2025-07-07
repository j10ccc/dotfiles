{
  description = "Nix configuration for Breeze";

  inputs = {
    nixpkgs.url = "github:nixOS/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      name = "Breeze";
      configuration = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        environment.systemPackages = with pkgs; [
          git
          neovim
          fish
          eza
          zoxide
          ripgrep
          fd
          devbox
          lazygit
          vivid
          nodejs_22
          pnpm
          bun
          nodePackages."@antfu/ni"
          wezterm
          localsend
          whistle
          zoxide
          direnv
          nixfmt-classic
        ];

        homebrew = {
          enable = true;
          brews = [ "mas" ];
          casks = [
            "snipaste"
            "maccy"
            "iina"
            "eloston-chromium"
            "stats"
            "the-unarchiver"
            "telegram"
            "tencent-lemon"
            "aldente"
            "docker"
            "obsidian"
            "vscodium"
            "clash-verge-rev"
            "apifox"
          ];
          masApps = {
            "TickTick" = 966085870;
            "WeChat" = 836500024;
            "QQ" = 451108668;
            "Feishu" = 1551632588;
            "OneDrive" = 823766827;
          };
          onActivation.cleanup = "zap";
        };

        fonts.packages = with pkgs; [
          noto-fonts-cjk-sans
          noto-fonts-emoji
          nerd-fonts.blex-mono
        ];

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Enable alternative shell support in nix-darwin.
        programs.fish.enable = true;

        system = {
          # Set Git commit hash for darwin-version.
          configurationRevision = self.rev or self.dirtyRev or null;

          # Used for backwards compatibility, please read the changelog before changing.
          # $ darwin-rebuild changelog
          stateVersion = 5;

          primaryUser = "j10c";

          defaults = {
            NSGlobalDomain = {
              ApplePressAndHoldEnabled = false;
              AppleShowAllExtensions = true;
              "com.apple.keyboard.fnState" = true;
            };
            finder = {
              ShowPathbar = true;
              AppleShowAllExtensions = true;
            };
            hitoolbox.AppleFnUsageType = "Show Emoji & Symbols";
            menuExtraClock = {
              Show24Hour = false;
              ShowAMPM = true;
              ShowDate = 2;
              ShowDayOfWeek = false;
              ShowSeconds = false;
              ShowDayOfMonth = false;
            };
            dock.wvous-tl-corner = 4; # Show desktop
          };

          keyboard = {
            enableKeyMapping = true;
            remapCapsLockToControl = true;
          };
        };

        # The platform the configuration will be used on.
        nixpkgs.hostPlatform = "aarch64-darwin";

        nix.enable = false;
      };
    in {
      # Build darwin flake using:
      # $ darwin-rebuild build --flake .#simple
      darwinConfigurations.${name} =
        nix-darwin.lib.darwinSystem { modules = [ configuration ]; };

      # Expose the package set, including overlays, for convenience.
      darwinPackages = self.darwinConfigurations.${name}.pkgs;
    };
}
