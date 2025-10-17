{ pkgs, ... }:

{
  home.stateVersion = "25.05";
  home.homeDirectory = /Users/bytedance;

  home.packages = with pkgs; [
    devbox
    wezterm
    obsidian
    vscodium
    localsend
    whistle
    pnpm
    ni
    gemini-cli
    nodejs_24
    bun
    bat
    bat-extras.prettybat
  ];

  # misc files
  home.file = {
    ".gitignore_global" = { source = ../../modules/misc/.gitignore_global; };
  };

  home.file.".config/wezterm" = {
    source = ../../modules/wezterm;
    recursive = true;
  };

  home.file.".config/fish" = {
    source = ../../modules/fish;
    recursive = true;
  };

  home.file."Library/Application Support/VSCodium/User" = {
    source = ../../modules/vscodium;
    recursive = true;
  };

  home.file.".gemini" = {
    source = ../../modules/gemini;
    recursive = true;
  };

  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "master";
      core.excludesFile = "~/.gitignore_global";
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = "source ~/.config/fish/config-entry.fish";
  };

  programs.vivid = {
    enable = true;
    enableFishIntegration = true;
    activeTheme = "nord";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.bat = {
    enable = true;
    config = { theme = "Nord"; };
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
  };
}
