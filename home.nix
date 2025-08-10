{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";

  home.packages = [
    pkgs.neovim
  ];

  home.xdg.configFile."nvim".source = ./nvim;
} 
