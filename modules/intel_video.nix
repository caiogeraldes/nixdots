{ pkgs, ... }:

{

  nixpkgs.config.packageOverrides = pkgs: {
    intel-vaapi-driver = pkgs.intel-vaapi-driver.override { enableHybridCodec = true; };
  };
  hardware.intel-gpu-tools.enable = true;
  hardware.graphics = { # hardware.graphics on unstable
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # LIBVA_DRIVER_NAME=i965 (older but works better for Firefox/Chromium)
      libvdpau-va-gl
    ];
  };
  environment.systemPackages = with pkgs; [
    ffmpeg
  ];
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Force intel-media-driver
  # environment.variables = {
    # GDK_SCALE = "2";
    # GDK_DPI_SCALE = "1.5";
  # };
}
