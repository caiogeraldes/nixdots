{ config, inputs, ... }:
{
  home.file."${config.home.homeDirectory}/img/wallp/01.jpg" = {
    source = ../../assets/the_biglin_brothers_racing_1953.7.1.jpg;
  };
  services.hyprpaper = {
    enable = true;
    settings = {
    preload = [ "/home/caiog/img/wallp/01.jpg" ];
    wallpaper = [", /home/caiog/img/wallp/01.jpg"];
    };
  };
}
