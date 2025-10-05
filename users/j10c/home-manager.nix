{ pkgs, ... }:

{
  home.stateVersion = "25.05";
  home.homeDirectory = /Users/j10c;

  home.packages = with pkgs; [
    devbox
    nodejs_22
    pnpm
    bun
    nodePackages."@antfu/ni"
    wezterm
    localsend
    whistle
  ];

  home.file.".config/wezterm" = {
    source = ../../modules/wezterm;
    recursive = true;
  };
 
  home.file.".config/fish" = {
    source = ../../modules/fish;
    recursive = true;
  };

  programs.git = {
    enable = true;
    userName = "j10c";
    userEmail = "blyb1739@gmail.com";
  };

  programs.fish = { enable = true; };

}
