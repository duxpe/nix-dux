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
    # Editors
    vim # ✏️ Terminal-based text editor
    vscode # 🖥️ Visual Studio Code
    neovim # ✏️ Enhanced version of Vim

    # Version Control
    git # 🗃️ Version control system

    # System Monitoring
    htop # 📊 Interactive process viewer
    btop # 📊 Resource monitor
    inxi # 📊 System information tool

    # Terminals
    kitty # 🐱 GPU-accelerated terminal emulator
    alacritty # 🖥️ Fast, cross-platform terminal emulator

    # System Utilities
    neofetch # 🖼️ System information tool
    nixfmt-rfc-style # 🛠️ Nix code formatter
    brightnessctl # 🌞 Control screen brightness
    grim # 📸 Screenshot utility for Wayland
    slurp # 📐 Select a region in Wayland
    swappy # ✏️ Wayland screenshot editing tool
    imagemagick # 🖼️ Image manipulation tool
    wallust # 🖼️ Wallpaper manager
    pamixer # 🔊 PulseAudio mixer
    pavucontrol # 🔊 PulseAudio volume control
    playerctl # 🎵 Media player controller

    # Wayland / Hyprland Enhancements
    waybar # 📊 Status bar for Wayland
    dunst # 🔔 Notification daemon
    xfce.thunar # 📁 File manager
    xfce.thunar-archive-plugin # 📦 Archive plugin for Thunar
    rofi-wayland # 🚀 Application launcher
    hyprland-protocols # 📜 Protocols for Hyprland
    xdg-desktop-portal-hyprland # 🌐 Hyprland portal backend
    xdg-desktop-portal # 🌍 Desktop integration portal
    xdg-desktop-portal-wlr # 🌐 Wayland portal backend
    hyprcursor # 🖱️ Cursor theme for Hyprland
    hyprpaper # 🖼️ Wallpaper manager for Hyprland
    swaybg # 🖼️ Background setter for Wayland
    linux-wallpaperengine # 🖼️ Animated Wallpaper Engine
    wayland-utils # 🛠️ Utilities for Wayland
    networkmanagerapplet # 🌐 Network manager applet
    wlroots # 🛠️ Wayland compositor library
    hypridle # 💤 Idle management for Hyprland
    hyprlock # 🔒 Screen locker for Hyprland
    pyprland # 🐍 Python bindings for Hyprland
    wl-clipboard # 📋 Clipboard utilities for Wayland
    wlogout # 🚪 Logout menu for Wayland
    wlsunset # 🌅 Day/night color temperature adjustment
    libsForQt5.qt5ct # ⚙️ Qt5 configuration tool
    qt6ct # ⚙️ Qt6 configuration tool
    nwg-look # 🎨 GTK and icon theme switcher
    gnome-icon-theme # 🖼️ GNOME icon theme

    # Utilities
    xorg.xkill # ❌ Kill a client by its X resource
    zip # 📦 Compression utility
    obs-studio # 🎥 Screen recording and streaming
    flameshot # 📸 Screenshot tool
    usbimager # 💾 Write images to USB drives
    cmatrix # 🖥️ Scrolling 'Matrix' terminal effect
    unzip # 📦 Decompression utility
    networkmanagerapplet # 🌐 Network manager applet
    jq # 🛠️ JSON processor
    linux-wifi-hotspot # 🌐 Create WiFi hotspots
    desktop-file-utils # 🛠️ Utilities for .desktop files
    shared-mime-info # 🛠️ MIME type database
    xdg-utils # 🛠️ Utilities for XDG environments
    xdg-user-dirs # 🛠️ Manage user directories
    xorg.xhost # 🛠️ Server access control program

    # Browsers
    ungoogled-chromium # 🌐 Privacy-focused web browser
    google-chrome # 🌐 Popular web browser

    # Productivity
    obsidian # 📝 Note-taking and knowledge base
    drawio # 🖼️ Diagramming tool
    inkscape # 🖼️ Vector graphics editor
    logisim-evolution # 🔌 Digital logic design tool

    # Java Development
    jdk # ☕ Java Development Kit
    eclipses.eclipse-sdk # ☕ Integrated development environment for Java

    # C / C++ Development
    gcc # 🛠️ GNU Compiler Collection
    libgcc # 🛠️ GCC runtime library

    # Outros pacotes (gráficos e estabilidade)
    mesa # 🛠️ Open-source graphics library
    libva # 🛠️ Video acceleration API
    libvdpau # 🛠️ Video Decode and Presentation API for Unix
    vulkan-loader # 🛠️ Vulkan API loader
    vulkan-tools # 🛠️ Vulkan utilities

    # ssh management
    gnome-keyring # 🔑 GNOME keyring manager
  ];

  fonts.packages = with pkgs; [
    # Fonts
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
