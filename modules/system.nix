{
  config,
  pkgs,
  lib,
  inputs,
  options,
  ...
}:
{
  # Import configurations
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./system/bootloader.nix
    ./system/package.nix
    ./system/locale.nix
    ./system/users.nix
    ./system/network.nix
    ./system/audio.nix
    ./system/peripherals.nix
    ./system/xserver.nix
    ./system/hyprland.nix
    ./system/greetd.nix
  ];

  # Nix settings
  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Home Manager settings
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Enable GNOME Keyring
  services.gnome.gnome-keyring.enable = true;

  # GnuPG settings
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Hardware settings
  hardware.graphics.enable32Bit = true;

  # System state version
  system.stateVersion = "24.05"; # Do not change...
}
