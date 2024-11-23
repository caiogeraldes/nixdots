{ config, ... }:

{
  home.file."${config.xdg.configHome}/waybar" = {
    source = ../configs/waybar_rua;
    recursive = true;
  };
}
