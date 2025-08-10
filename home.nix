{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";
  home.username = "ktsirangelos";
  home.homeDirectory = "/Users/ktsirangelos";

  home.packages = [
    pkgs.neovim
  ];

  programs.home-manager.enable = true;

  programs.kitty = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ./configs/kitty/kitty.conf}
      ${builtins.readFile ./configs/kitty/current-theme.conf}
    '';
  };

  programs.zsh = {
    enable = true;
    initContent = builtins.readFile ./configs/zsh/.zshrc;
  };

  xdg.configFile."nvim".source = ./configs/nvim;
  home.file.".aerospace.toml".source = ./configs/aerospace/aerospace.toml;
}
