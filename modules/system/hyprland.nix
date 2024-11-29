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
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;

    xwayland.enable = true;
  };

  services.hypridle = {
    enable = true; # enable Hypridle idle manager, needed for Hyprlock
    package = pkgs.hypridle;
  };

  programs.waybar = {
    enable = true; # enable waybar launcher
    package = pkgs.waybar;
  };

    # Environment variables to start the session with
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # for electron and chromium apps to run on wayland
    MOZ_ENABLE_WAYLAND = "1"; # firefox should always run on wayland

    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";
  };

  # hyprlock.enable = true;
}
