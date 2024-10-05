{ config, pkgs, ... }:
let
  rPackages = pkgs.rPackages;
in {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "caiog";
  home.homeDirectory = "/home/caiog";
  xdg.userDirs = {
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

  home.packages = with pkgs; [
    zsh
    texliveFull
    texlab
    zathura
    wl-clipboard-rs
    hyprpaper
    rPackages.tidyverse
    rPackages.openssl
    rPackages.devtools
    rPackages.xml2
    rPackages.usethis
    rPackages.git2r
    rPackages.rnaturalearth
    rPackages.rnaturalearthdata
    nautilus
    gtk-engine-murrine
    tmux
  ];

  programs = {
    git = {
      enable = true;
      delta.enable = true;
      userName = "Caio Geraldes";
      userEmail = "caio.geraldes@usp.br";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    bat = {
      enable = true;
      themes = {
        gruvbox = {
          src = pkgs.fetchFromGitHub  {
            owner = "molchalin";
            repo = "gruvbox-material-bat";
            rev = "843e67f926bbc4707256f6a8d0d8b819e5006bc1";
            hash = "sha256-J6UePv2qyZcvWa9IKv943i1w4bteWp2tjF9n2taYJog=";
          };
          file = "gruvbox-material-dark.tmTheme";
        };
      };
      config = {
        theme = "gruvbox";
      };
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      options = [
        "--cmd cd"
      ];
    };
    yazi = {
      enable = true;
      enableZshIntegration = true;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = true;
      extraOptions = [
        "--group-directories-first"
      ];
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        vim = "nvim";
        # ll = "ls -l";
        lg="eza --group-directories-first --icons --git-ignore";
        la="eza --group-directories-first --icons -al --git";
        ll="eza --group-directories-first --icons -l --git";
        update = "sudo nixos-eebuild switch";
        _cat="/usr/bin/cat";
        cat="bat";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      sessionVariables = {
       PATH = "$PATH:$HOME/.cargo/bin";
      };
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git" 
          "vi-mode" 
          "compleat" 
          "rust" 
          "tmux" 
          "gh" 
          "fzf" 
          "golang" 
        ];
        theme = "robbyrussell";
      };
    };
  };

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

  home.sessionVariables = {
    EDITOR = "nvim";
    MANROFFOPT = "-c";
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    R_LIBS_USER = "$HOME/.R/site-library/";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

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

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.
}
