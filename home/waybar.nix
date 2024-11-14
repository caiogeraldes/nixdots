{ config, inputs, ... }:

{
  home.file."${config.xdg.configHome}/waybar" = {
    source = ../configs/waybar;
    recursive = true;
  };
}
