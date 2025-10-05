{ config, pkgs, ... }:

{
  home.username = "j10c";
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

  programs.git = {
    enable = true;
    userName = "j10c";
    userEmail = "blyb1739@gmail.com";
  };

  home.stateVersion = "25.05";
}
