{ config, ... }:

{
  home.file."${config.home.homeDirectory}/.scripts" = {
    source = ../scripts;
    recursive = true;
  };
}
