{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Bluetooth configuration
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  # Printer configuration
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}

