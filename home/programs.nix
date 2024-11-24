{ pkgs, ... }:
{

  home.packages = with pkgs; [
    zsh
    texlab
    wl-clipboard-rs
    nautilus
    tmux
    newsboat
    grim
    slurp
    xwayland
    rustup
    python3
    socat
    nicotine-plus
    mpv
    miller
    tidy-viewer
    fd
    xdotool
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
