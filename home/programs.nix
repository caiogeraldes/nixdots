{ config, pkgs, inputs, ... }:
{

  home.packages = with pkgs; [
    zsh
    texliveFull
    texlab
    zathura
    wl-clipboard-rs
    hyprpaper
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
}