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
        "x-scheme-handler/http" = ["zen.desktop"];
        "x-scheme-handler/https" = ["zen.desktop"];
        "x-scheme-handler/chrome" = ["zen.desktop"];
        "text/html" = ["zen.desktop"];
        "application/x-extension-htm" = ["zen.desktop"];
        "application/x-extension-html" = ["zen.desktop"];
        "application/x-extension-shtml" = ["zen.desktop"];
        "application/xhtml+xml" = ["zen.desktop"];
        "application/x-extension-xhtml" = ["zen.desktop"];
        "application/x-extension-xht" = ["zen.desktop"];
      };
    };
  };
}
