{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./code.nix
  ];
  home.username = "masihkasar";
  home.homeDirectory = "/home/masihkasar";
  home.stateVersion = "23.05";
  home.packages = with pkgs; [
    neofetch
  ];
  programs.home-manager.enable = true;
}

