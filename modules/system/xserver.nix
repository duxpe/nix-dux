{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # X11Server configuration
  services.xserver.enable = true; # Disable this if only using the Wayland.
  services.xserver.libinput.enable = true; # touchpad
}
