{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Network configuration

  # Set the hostname
  networking.hostName = "duxpe"; # Define your hostname.

  # Enable NetworkManager
  networking.networkmanager.enable = true;
}
