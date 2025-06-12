{ pkgs, ... }:
{

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    nautilus
    grim
    slurp
    xwayland
    nicotine-plus
    mpv
    xdotool
    kdePackages.okular
    beeper
  ];

  services = {
    mako = {
      enable = true;
      settings = {
        default-timeout = 5000;
        background-color = "#32302f";
        text-color = "#d4be98";
        border-radius = 10;
        border-size = 0;
        width = 400;
        font = "Mononoki Nerd Font 10";
      };
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
