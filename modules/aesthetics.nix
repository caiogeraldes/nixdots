{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    betterlockscreen
    waybar
    mako
    libnotify
  ];
}
