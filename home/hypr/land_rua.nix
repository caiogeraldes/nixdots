{ ... }:
{
  imports = [
    ./land.nix
  ];
  wayland.windowManager.hyprland = {
    settings = {
      monitor=[
      "eDP-1,preferred,auto,1.458333"
      "HDMI-A-1,preferred,auto,1"
      ];
    };
  };
}

