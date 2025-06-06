{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    clementine
    nicotine-plus
    playerctl
    rmpc
    mpc-cli
  ];
  services = {
    playerctld.enable = true;
    mpdris2 = {
      enable = true;
      notifications = true;
    };
    mpdscribble = {
      enable = true;
      endpoints = {
          "last.fm" = {
            passwordFile = "/run/agenix/lastfm";
            username = "silenus32";
          };
      };
    };
    mpd = { 
      enable = true;
      musicDirectory = "/home/caiog/mus/";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "PipeWire Sound Server"
        }
      '';
    };
  };
}
