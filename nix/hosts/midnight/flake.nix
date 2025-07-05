{
  description = "Nix configuration for Midnight";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs }:
    let
      name = "Midnight";
      configuration = { pkgs, ... }: {
        nixpkgs.config.allowUnfree = true;

        environment.variables.EDITOR = "nvim";
        environment.systemPackages = with pkgs; [
          neovim
          fish
          eza
          zoxide
          ripgrep
          nixpkgs-fmt
          fd
          devbox
          lazygit
          vivid
          direnv
          wezterm
          obsidian
          vscodium
          localsend
          git
          whistle
          pnpm
          nodePackages."@antfu/ni"
          nodejs_20
        ];

        homebrew = {
          enable = true;
          brews = [ "mas" "ast-grep" ];
          casks = [
            "snipaste"
            "maccy"
            "iina"
            "eloston-chromium"
            "stats"
            "the-unarchiver"
            "telegram"
            "tencent-lemon"
            "wetype"
            "aldente"
            "mitmproxy"
            "logi-options+"
            "apifox"
            "wpsoffice-cn"
          ];
          masApps = {
            "TickTick" = 966085870;
            "Refined Github" = 1519867270;
            "Feishu" = 1551632588;
          };
          onActivation.cleanup = "zap";
        };

        fonts.packages = with pkgs; [
          noto-fonts-cjk-sans
          noto-fonts-cjk-serif
          noto-fonts-emoji
          nerd-fonts.blex-mono
        ];

        # Necessary for using flakes on this system.
        nix.settings.experimental-features = "nix-command flakes";

        # Enable alternative shell support in nix-darwin.
        programs.fish.enable = true;

        system = {
          stateVersion = 5;
          # Set Git commit hash for darwin-version.
          configurationRevision = self.rev or self.dirtyRev or null;

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

        nixpkgs.hostPlatform = "aarch64-darwin";
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
