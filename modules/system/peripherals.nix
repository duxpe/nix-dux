{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Bluetooth configuration
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
  services.blueman.enable = true;

  # Printer configuration
  services.printing.enable = true;

  # Avahi configuration for network discovery
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}
