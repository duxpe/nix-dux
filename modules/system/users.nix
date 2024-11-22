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
    isNormalUser = true;
    description = "duxpe";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };
}

