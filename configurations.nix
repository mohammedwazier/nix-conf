{ config, pkgs, ... }:

{
  # nixpkgs.config.allowUnfree = true;

  # hardware.pulseaudio.enable = true;

  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    home-manager
    btop
    nix-index
    git
    curl
    wget

    gtk3
  ];

  # nix = {
  #   package = pkgs.nixFlakes;
  #   extraOptions = "experimental-features = nix-command flakes";
  # };

  system.stateVersion = "23.11";
}