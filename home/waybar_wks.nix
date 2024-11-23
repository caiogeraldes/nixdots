{ config, ... }:

{
  home.file."${config.xdg.configHome}/waybar" = {
    source = ../configs/waybar_wkst;
    recursive = true;
  };
}
