{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    calc
    hyprpaper
    gtk-engine-murrine
    hyprlock
    kdePackages.polkit-kde-agent-1
    brightnessctl
    betterlockscreen
    swaylock
    waybar
    mako
    wofi
    rofi-wayland
    libnotify
    avizo
    jq
    wlprop
  ];
}
