{ ... }: {
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking = {
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
      # wifi.backend = "iwd";
    };
    # wireless.iwd = {
    # enable = true;
    # settings = {
    # IPv6 = {
    # Enabled = true;
    # };
    # Settings = {
    # AutoConnect = true;
    # };
    # };
    # };
    hosts = {
      "192.168.1.104" = [ "hsamg" ];
      "192.168.1.239" = [ "hdesk" ];
      "192.168.1.122" = [ "rleno" ];
    };
    firewall = rec {
      allowedTCPPortRanges = [{
        from = 1714;
        to = 1764;
      }];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };

  programs.nm-applet.enable = true;
}

