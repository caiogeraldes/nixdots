{ config, ... }:

{
  home.file."${config.xdg.configHome}/rmpc" = {
    source = ../configs/rmpc;
    recursive = true;
  };
}
