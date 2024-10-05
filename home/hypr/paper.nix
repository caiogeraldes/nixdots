{ config, input, ...}:

{
  home.file."${config.xdg.userDirs.pictures}/wallp/01.jpg" = {
    source = ../../assets/the_biglin_brothers_racing_1953.7.1.jpg;
  };

  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [
        "$HOME/img/wallp/01.jpg"
      ];
      wallpaper = [
        ", $HOME/img/wallp/01.jpg"
      ];
    };
  };
}
