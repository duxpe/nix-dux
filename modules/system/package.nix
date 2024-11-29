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
    btop
    inxi
    kitty
    alacritty

    nixfmt-rfc-style

    #System or Hardware
    brightnessctl
    grim
    slurp
    swappy
    swww
    imagemagick
    wallust
    pamixer
    pavucontrol
    playerctl

    #Wayland / Hyprland Enhancements
    waybar
    xdg-desktop-portal-wlr
    hyprcursor
    hypridle
    hyprlock
    swaylock
    wl-clipboard
    rofi-wayland
    swaynotificationcenter
    wlogout
    wlsunset
    pyprland
    libsForQt5.qt5ct
    qt6ct

    #Utils
    obs-studio
    flameshot
    usbimager
    cmatrix
    unzip
    networkmanagerapplet
    jq
    linux-wifi-hotspot
    desktop-file-utils
    shared-mime-info
    xdg-utils
    xdg-user-dirs
    xorg.xhost # needed for some packages running x11 like gparted

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
