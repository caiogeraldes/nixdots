{ config, pkgs, inputs, ... }:
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

  programs = {
    newsboat = {
      enable = true;
      extraConfig = ''
        color article                              color223 color236
        color background                           color100 color236
        color info                                 color142 color235
        color listfocus                            color214 color239
        color listfocus_unread                     color214 color96
        color listnormal                           color246 color237
        color listnormal_unread                    color175 color237
        highlight article \"^Feed:.*\"               color175 color237
        highlight article \"^Title:.*\"              color214 color237 bold
        highlight article \"^Author:.*\"             color167 color237
        highlight article \"^Link:.*\"               color109 color237
        highlight article \"^Date:.*\"               color142 color237
        highlight article \"\\[[0-9]\\+\\]\"         color208 color237 bold
        highlight article \"\\[[^0-9].*[0-9]\\+\\]\" color167 color237 bold
      '';
      urls = [
        { url = "https://old.linguistlist.org/issues/rss/mostrecent.xml"; }
        { url = "https://old.linguistlist.org/issues/rss/calls.xml"; }
        { url = "https://old.linguistlist.org/issues/rss/internships.xml"; }
        { url = "https://old.linguistlist.org/issues/rss/jobs.xml"; }
        { url = "https://old.linguistlist.org/issues/rss/software.xml"; }
        { url = "https://old.linguistlist.org/issues/rss/toc.xml"; }
      ];
    };
  };
}
