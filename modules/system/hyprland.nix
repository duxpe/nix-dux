{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Enable Hyprland Package
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;
  };

  services = {
    swww.enable = true;
    xdg-desktop-portal-wlr.enable = true;
    pipewire.enable = true;
    pipewire.support.wayland = true;
  };

  waybar.enable = true;
  hyprlock.enable = true;
}
