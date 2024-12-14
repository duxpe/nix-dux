{
  config,
  pkgs,
  lib,
  inputs,
  options,
  ...
}:
{
  # Import configurations
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    ./system/bootloader.nix
    ./system/package.nix
    ./system/locale.nix
    ./system/users.nix
    ./system/network.nix
    ./system/audio.nix
    ./system/peripherals.nix
    ./system/xserver.nix
    ./system/hyprland.nix
    ./system/greetd.nix
  ];

  # Nix settings
  nix = {
    package = pkgs.nixVersions.latest;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  # Home Manager settings
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Enable GNOME Keyring
  services.gnome.gnome-keyring.enable = true;

  # GnuPG settings
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Hardware settings
  hardware.graphics.enable32Bit = true;

  systemd.tmpfiles.rules = [
    "d /home/duxpe/Drives/GoogleDrive 0755 duxpe users"
    "d /home/duxpe/Drives/Dropbox 0755 duxpe users"
  ];

  boot.kernelModules = [ "fuse" ];

  programs.fuse.userAllowOther = true;
  programs.fuse.mountMax = 10;

  systemd.services.rclone-google = {
    description = "Mount Google Drive with Rclone";
    after = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Environment = "RCLONE_CONFIG=/home/duxpe/.config/rclone/rclone.conf";
      ExecStartPre = "/bin/mkdir -p /home/duxpe/Drives/GoogleDrive";
      ExecStart = "${pkgs.rclone}/bin/rclone mount google: /home/duxpe/Drives/GoogleDrive --vfs-cache-mode writes --allow-other --log-level DEBUG --log-file /tmp/rclone-google.log";
      ExecStop = "/run/wrappers/bin/fusermount3 -u /home/duxpe/Drives/GoogleDrive";
      Restart = "always";
      User = "duxpe";
      Group = "duxpe";
      AmbientCapabilities = "CAP_SYS_ADMIN";
      CapabilityBoundingSet = "CAP_SYS_ADMIN";
      ProtectSystem = "full";
      ProtectHome = "no";
      Type = "simple";
      NotifyAccess = "all";
      TimeoutStartSec = "10min";
      PermissionsStartOnly = true;
      MountFlags = "shared";
    };
  };

  systemd.services.rclone-dropbox = {
    description = "Mount Dropbox with Rclone";
    after = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      Environment = "RCLONE_CONFIG=/home/duxpe/.config/rclone/rclone.conf";
      ExecStart = "${pkgs.rclone}/bin/rclone mount dropbox: /home/duxpe/Drives/Dropbox --vfs-cache-mode writes --allow-other";
      ExecStop = "/run/wrappers/bin/fusermount3 -u /home/duxpe/Drives/Dropbox";
      Restart = "always";
      User = "duxpe";
      Group = "users";
      AmbientCapabilities = "CAP_SYS_ADMIN";
      CapabilityBoundingSet = "CAP_SYS_ADMIN";
      ProtectSystem = "full";
      ProtectHome = "no";
      Type = "simple";
      NotifyAccess = "all";
      TimeoutStartSec = "10min";
    };
  };

  # System state version
  system.stateVersion = "24.05"; # Do not change...
}
