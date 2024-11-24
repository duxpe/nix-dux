{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Packages install

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    htop
    vscode
    nixfmt-rfc-style
    obs-studio
    flameshot
    gcc
    libgcc
    usbimager
    ungoogled-chromium
    google-chrome
  ];

}
