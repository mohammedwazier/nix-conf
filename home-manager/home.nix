{ config, pkgs, ... }:

let
  bambu-studio-appimage = pkgs.appimageTools.wrapType2 rec {
    name = "BambuStudio";
    pname = "bambustudio";
    version = "01.09.00.60";
    src = pkgs.fetchurl {
      url = "https://github.com/bambulab/BambuStudio/releases/download/v${version}/Bambu_Studio_linux_ubuntu_${version}.AppImage";
      sha256 = "sha256-qxV6pn1OVU/IGS2Lv954gm9ud1MtBr8Khdy2tJvkwj8=";
    };
    profile = ''
      export SSL_CERT_FILE="${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
      export GIO_MODULE_DIR="${pkgs.glib-networking}/lib/gio/modules/"
    '';
    extraPkgs = pkgs: with pkgs; [
      cacert
      curl
      glib
      glib-networking
      gst_all_1.gst-plugins-bad
      gst_all_1.gst-plugins-base
      gst_all_1.gst-plugins-good
      webkitgtk
      gtk3
    ];
  };
in
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
    # curl
    # wget
    bambu-studio-appimage
    cmake
    nixfmt-classic
    neofetch
    cachix

    discord
    zoom-us
    git
    dbeaver-bin
    tmux
    # bambu-studio
    orca-slicer
    vscode
    postman

    brave
    keepassxc
    libreoffice

    unrar

    # pulseaudio
    mpv
    pavucontrol

    steam
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
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    initExtra = ''
      if [[ ! -f /etc/shells ]] || ! grep -q "${pkgs.zsh}/bin/zsh" /etc/shells; then
        echo "Adding zsh to /etc/shells..."
        sudo sh -c "echo ${pkgs.zsh}/bin/zsh >> /etc/shells"
      fi
    '';
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
  };
  home.file.".shell".text = "${pkgs.zsh}/bin/zsh";

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

