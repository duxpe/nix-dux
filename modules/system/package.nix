{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
{
  # Packages install
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    git
    htop

    nixfmt-rfc-style

    #Utils
    obs-studio
    flameshot
    usbimager
    cmatrix

    #Browsers
    ungoogled-chromium
    google-chrome

    #Productivity
    obsidian
    drawio
    inkscape
    logisim-evolution

    #Coding
    vscode
    neovim

    ##Java
    jdk
    eclipses.eclipse-sdk

    ##C / C++
    gcc
    libgcc
  ];

  programs.firefox.enable = true;

}
