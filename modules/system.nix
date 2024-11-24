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
    ./system/package.nix
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

  system.stateVersion = "24.05"; # Do not change...

}
