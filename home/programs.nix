{  pkgs, ... }:
{

  home.packages = with pkgs; [
    zsh
    texliveFull
    texlab
    zathura
    wl-clipboard-rs
    nautilus
    tmux
    newsboat
    sioyek
  ];

  services = {
    mako = {
      enable = true;
      defaultTimeout = 5000;
      backgroundColor = "#32302f";
      textColor = "#d4be98";
      borderRadius = 10;
      borderSize = 0;
      width = 400;
      font = "Mononoki Nerd Font 10";
    };
  };

}
