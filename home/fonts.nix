{ config, ... }:

{
  home.file."$(config.home.homeDirectory)/.local/share/fonts/" = {
    source = ../assets/fonts;
    recursive = true;
  };
}
