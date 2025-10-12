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
    nodejs_20
    bun
    bat
    bat-extras.prettybat
  ];

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

  programs.git = { enable = true; };

  programs.fish = { enable = true; };

  programs.vivid = {
    enable = true;
    enableFishIntegration = true;
    activeTheme = "nord";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
