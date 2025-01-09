{ config, ... }:

{
  home.file."${config.xdg.configHome}/kitty" = {
    source = ../configs/kitty;
    recursive = true;
  };
}
