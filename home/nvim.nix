{ config, inputs, ... }:

{
  home.file."${config.xdg.configHome}/nvim" = {
    source = ../configs/nvim;
    recursive = true;
  };
}
