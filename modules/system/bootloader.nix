/*Note: Everytime you change this file, please run:

> sudo nixos-rebuild switch --flake .#duxpe --install-bootloader

*/
{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Grub configuration
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.devices = [ "nodev" ];
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = false;
  boot.loader.grub.default = "saved";
  boot.loader.grub.memtest86.enable = false;
  boot.loader.grub.fontSize = 26;
  boot.loader.grub.gfxmodeEfi = "auto";
  boot.loader.grub.gfxmodeBios = "auto";
  boot.loader.grub.extraEntries = ''
    submenu "More Options..." {
      menuentry "Reboot" {
        reboot
      }
      menuentry "Poweroff" {
        halt
      }
      menuentry "UEFI Firmware Settings" {
        fwsetup
      }
    }
  '';

}

