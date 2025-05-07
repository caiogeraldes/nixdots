{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    calc
    hyprpaper
    gtk-engine-murrine
    hyprlock
    polkit-kde-agent
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
