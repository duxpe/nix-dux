{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Users configuration
  users.users.duxpe = {
    # Basic user settings
    isNormalUser = true;
    description = "duxpe";

    # User groups
    extraGroups = [
      "networkmanager"
      "wheel"
    ];

    # User packages
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}
