{ config, pkgs, inputs, ... }:
{
  imports = [
    ./btop.nix
    ./yazi.nix
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
      enable = false;
      enableZshIntegration = true;
      package = inputs.yazi.packages.${pkgs.system}.default;
    };
    eza = {
      enable = true;
      enableZshIntegration = true;
      icons = "auto";
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
        stig = "$HOME/.local/bin/stig";
        btop = "$HOME/.local/bin/btop";
        nvimconf = "cd  $HOME/dotfiles/configs/nvim & nvim";
        cnc = "cd  $HOME/dotfiles/configs/nvim";
        # ll = "ls -l";
        lg="eza --group-directories-first --icons --git-ignore";
        la="eza --group-directories-first --icons -al --git";
        ll="eza --group-directories-first --icons -l --git";
        update = "sudo nixos-eebuild switch";
        _cat="/usr/bin/cat";
        cat="bat";
        calibre="QT_SCALE_FACTOR_ROUNDING_POLICY=RoundPreferFloor calibre";
      };
      history = {
        size = 10000;
        path = "${config.xdg.dataHome}/zsh/history";
      };
      sessionVariables = {
        TEXMFHOME = "$HOME/.texlive2023/";
        PATH = "$PATH:$HOME/.cargo/bin:$HOME/.scripts:$HOME/.local/bin";
        # QT_SCALE_FACTOR_ROUNDING_POLICY="RoundPreferFloor";
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
      initExtra = "
        source $HOME/.scripts/yy
        ";
    };
  };
}
