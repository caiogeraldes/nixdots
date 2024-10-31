{  lib, pkgs, ... }:
{

  home.packages = with pkgs; [
    zsh
    texlab
    zathura
    wl-clipboard-rs
    gnome.nautilus
    tmux
    newsboat
    sioyek
    grim
    slurp
    xwayland
    rustup
    eww
    python3
    socat
    qbittorrent
    nicotine-plus
    vlc
    mpv
    pftk
    poppler_utils
    ocrmypdf
    tesseract4
    pdf4qt
  ];

  services = {
    mako = {
      enable = true;
      defaultTimeout = 5000;
      backgroundColor = "#32302f";
      textColor = "#d4be98";
      borderRadius = 10;
      borderSize = 0;
      width = 400;
      font = "Mononoki Nerd Font 10";
    };
    avizo = {
      enable = true;
      settings = {
      default = {
        time = 1.0;
        y-offset = 0.5;
        fade-in = 0.1;
        fade-out = 0.2;
        padding = 10;
        };
      };
    };
  };
}
