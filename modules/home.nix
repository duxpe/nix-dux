{ config, pkgs, ... }:

{
  imports = [
    ./system/hyprland.nix
  ];
  programs.vim.enable = true;
}
