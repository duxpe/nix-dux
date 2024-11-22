{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Network configuration
  networking.hostName = "duxpe"; # Define your hostname.
  networking.networkmanager.enable = true;
}

