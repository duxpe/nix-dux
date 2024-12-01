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
    neofetch
    nixfmt-rfc-style

    #System or Hardware
    brightnessctl
    grim
    slurp
    swappy
    imagemagick
    wallust
    pamixer
    pavucontrol
    playerctl

    #Wayland / Hyprland Enhancements
    waybar
    dunst
    xfce.thunar
    xfce.thunar-archive-plugin
    rofi-wayland
    hyprland-protocols
    xdg-desktop-portal-hyprland
    hyprcursor
    hyprpaper
    hypridle
    hyprlock
    pyprland
    wl-clipboard
    wlogout
    wlsunset
    pyprland
    libsForQt5.qt5ct
    qt6ct
    nwg-look
    gnome-icon-theme

    #Utils
    xorg.xkill
    zip
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

  fonts.packages = with pkgs; [
    #Fonts
    nerdfonts
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
  ];

  programs.thunar.plugins = with pkgs.xfce; [
    thunar-archive-plugin
  ];

  programs.firefox.enable = true;

}
