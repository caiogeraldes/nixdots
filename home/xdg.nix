{ config, ... }:
{
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
      desktop="${config.home.homeDirectory}/desktop";
      download="${config.home.homeDirectory}/down";
      templates="${config.home.homeDirectory}/templates";
      documents="${config.home.homeDirectory}/docs";
      music="${config.home.homeDirectory}/mus";
      pictures="${config.home.homeDirectory}/img";
      videos="${config.home.homeDirectory}/vids";
      publicShare="${config.home.homeDirectory}/pub";
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "application/pdf" = ["org.pwmt.zathura.desktop"];
      };
    };
  };
}
