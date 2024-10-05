{ config, ... }:

{
  home.file."${config.xdg.dataHome}/fonts/" = {
    source = ../assets/fonts;
    recursive = true;
  };
}
