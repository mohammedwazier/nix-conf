{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  # nixpkgs.packages.orca-slicer.enable = true;
  imports = [
    ./code.nix
  ];
  home.username = "masihkasar";
  home.homeDirectory = "/home/masihkasar";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    curl
    wget
    cmake
    nixfmt-classic
    neofetch
    cachix

    discord
    zoom-us
    git
    dbeaver-bin
    tmux
    bambu-studio
    orca-slicer
    vscode
    postman

    brave
    keepassxc
    libreoffice

    unrar
  ];
  programs.home-manager.enable = true;
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "robbyrussell";
      # plugins = [
      # ];
    };
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
  };
  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultOptions =
        [ "--height 40%" "--layout=reverse" "--border" "--inline-info" ];
    };
    htop = {
      enable = true;
    };
    btop = {
      enable = true;
    };
    tmux = {
      enable = true;
    };
  };
}

