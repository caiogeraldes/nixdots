{ config, ... }:

{
  home.file."${config.home.homeDirectory}/.tmux.conf" = {
    source = ../configs/tmux/.tmux.conf;
  };
}
