{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    clementine
    nicotine-plus
    playerctl
    rmpc
  ];
  services = {
    playerctld.enable = true;
    mpd-mpris.enable = true;
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
