{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
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
  ];
}
