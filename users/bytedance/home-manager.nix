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
    nodePackages."@antfu/ni"
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

  home.file.".config/nvim" = {
    source = ../../modules/nvim;
    recursive = true;
  };

  programs.git = { enable = true; };
  programs.fish = { enable = true; };
}
