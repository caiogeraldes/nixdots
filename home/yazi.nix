{ config, ... }:

{
  home.file."${config.xdg.configHome}/yazi" = {
    source = ../configs/yazi;
    recursive = true;
  };
}
