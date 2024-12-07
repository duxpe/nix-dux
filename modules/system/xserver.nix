{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # X11 Server configuration
  # Uncomment the following line to enable the X11 server.
  # services.xserver.enable = true; # Disable this if only using Wayland.

  # Input device configuration
  services.libinput.enable = true; # Enable libinput for touchpad support
}
