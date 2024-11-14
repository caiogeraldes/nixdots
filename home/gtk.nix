{ pkgs, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Material-Dark";
      # package = pkgs.catppuccin-gtk;
    };
    iconTheme = {
      name = "Gruvbox-Material-Dark";
    };
    cursorTheme = {
      name = "Nordzy-cursors";
      package = pkgs.nordzy-cursor-theme;
      size = 24;
    };
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };
}
