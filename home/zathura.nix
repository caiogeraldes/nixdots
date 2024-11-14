{ config, ... }:

{
  home.file."${config.xdg.configHome}/zathura" = {
    source = ../configs/zathura;
    recursive = true;
  };
}
