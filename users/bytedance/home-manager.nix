{ pkgs, ... }:

{
  home.homeDirectory = /Users/bytedance;

  home.packages = with pkgs; [
    devbox
    wezterm
    obsidian
    vscodium
    localsend
    whistle
    pnpm
    nodePackages."@antfu/ni"
    nodejs_20
    bun
    bat
    bat-extras.prettybat
  ];

  programs.git = { enable = true; };

  programs.fish = { enable = true; };

  home.stateVersion = "25.05";
}
