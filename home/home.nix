{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "caiog";
  home.homeDirectory = "/home/caiog";
  imports = [
    ./terminal.nix
    ./xdg.nix
    ./programs.nix
    ./gtk.nix
    ./hypr.nix
    ./nvim.nix
    ./tmux.nix
    ./fonts.nix
    ./newsboat.nix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    MANROFFOPT = "-c";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    R_LIBS_USER = "$HOME/.R/site-library/";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;


  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
