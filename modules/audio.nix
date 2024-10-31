{ config, pkgs, ... }:
{
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.extraConfig.bluetoothEnhancements = {
      "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = true;
        "bluez5.enable-hw-volume" = true;
        "bluez5.roles" = [ "hsp_hs" "hsp_ag" "hfp_f" "hfp_ag" ];
      };
    };
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
    spotify
    clementine
    termusic
  ];

  services.mpd = { 
    enable = true;
    musicDirectory = "/home/caiog/mus/";
    user = "caiog";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "My PipeWire Output"
      }
    '';
  };
  systemd.services.mpd.environment = {
    # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/609
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.caiog.uid}"; # User-id must match above user. MPD will look inside this directory for the PipeWire socket.
  };
}
