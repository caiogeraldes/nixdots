{ ... }:
{
  imports = [
    ./land.nix
  ];
  wayland.windowManager.hyprland = {
    settings = {
      monitor=",preferred,auto,1.458333";
    };
  };
}

