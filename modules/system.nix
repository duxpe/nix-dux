{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./system/bootloader.nix
    ./system/locale.nix
    ./system/users.nix
    ./system/network.nix
    ./system/audio.nix
    ./system/peripherals.nix
    ./system/xserver.nix
  ];

  # Flakes
  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Home Manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    vscode
    nixfmt-rfc-style
    obs-studio
    flameshot
    gcc
    libgcc
    usbimager
    ungoogled-chromium
    google-chrome
  ];

  system.stateVersion = "24.05"; # Do not change...

}
