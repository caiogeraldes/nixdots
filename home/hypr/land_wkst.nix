{ ... }:
{
  imports = [
    ./land.nix
  ];
  wayland.windowManager.hyprland = {
    settings = {
      monitor="all,preferred,auto,1";
    };
  };
}

