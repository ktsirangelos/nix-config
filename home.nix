{ config, pkgs, ... }:

{
  home.stateVersion = "24.05";
  home.username = "ktsirangelos";
  home.homeDirectory = "/Users/ktsirangelos";

  home.packages = [
    pkgs.aspell
    pkgs.automake
    pkgs.bat
    pkgs.cmake
    pkgs.coreutils
    pkgs.devspace
    pkgs.diff-so-fancy
    pkgs.fd
    pkgs.fish
    pkgs.fzf
    pkgs.git
    pkgs.kubernetes-helm
    pkgs.imagemagick
    pkgs.kubectl
    pkgs.lftp
    pkgs.libjpeg
    pkgs.libpng
    pkgs.libpq
    pkgs.neovim
    pkgs.openssl
    pkgs.php83Packages.php-cs-fixer
    pkgs.pkg-config
    pkgs.postgresql_17
    pkgs.prettierd
    pkgs.rbenv
    pkgs.redis
    pkgs.ripgrep
    pkgs.sqlite
    pkgs.tig
    pkgs.tree
    pkgs.nodePackages.typescript
    pkgs.viu
    pkgs.wdiff
    pkgs.wget
    pkgs.file
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
  home.file.".gitconfig".source = ./configs/git/gitconfig;
  home.file.".gitconfig.skroutz".source = ./configs/git/gitconfig.skroutz;
}
