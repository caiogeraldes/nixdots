# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, lib, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/ssh.nix
    ../../modules/samba.nix
    ../../modules/intel_video.nix
    # ../../modules/battery.nix
    ../../modules/audio.nix
    ../../modules/bluetooth.nix
    ../../modules/network.nix
    ../../modules/blocky.nix
    ../../modules/secrets.nix
    ../../modules/jellyfin.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  # Set your time zone.
  time = {
    timeZone = "America/Sao_Paulo";
    hardwareClockInLocalTime = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "pt_BR.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "br";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "br-abnt2";

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.caiog = {
    isNormalUser = true;
    description = "Caio Geraldes";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [ ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    fzf
    nerd-fonts.mononoki
    noto-fonts
    ouch
    gh
    ripgrep
    gcc
    clang
    yarn
    go
    zig
    gnumake
    cmake
    unzip
    cargo
    cargo-update
    mercurial
    luarocks
    imv
    tree-sitter
    lua
    killall
    openssl
    kitty
    just
    intel-gpu-tools
    nodejs_24
    inputs.agenix.packages."${system}".default
    transmission_4
    stig
    python311Packages.requests
    stash
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 9999 ];
  networking.firewall.allowedUDPPorts = [ 9999 ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

  programs.nix-ld.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  # programs.nix-ld.libraries = with pkgs; [
  #   # Add any missing dynamic libraries for unpackaged programs
  #   # here, NOT in environment.systemPackages
  # ];
  networking.hostName = "hsamg"; # Define your hostname.

  fileSystems."/mnt/drive" = {
    device = "/dev/disk/by-uuid/b3cde716-f006-4103-9a9b-764470f2611a";
    fsType = "ext4";
    options = [ "user" "nofail" "x-gvfs-view" ];
  };

  # services.transmission = {
  # enable = true;
  # settings = {
  # download-dir = "/mnt/drive/Arquivos/Downloads/Complete";
  # incomplete-dir-enabled = true;
  # incomplete-dir = "/mnt/drive/Arquivos/Downloads/Incomplete/";
  # watch-dir-enabled = true;
  # watch-dir = "/mnt/drive/Arquivos/Downloads/Torrents/";
  # trash-original-torrent-files = true;
  # };
  # };

  powerManagement.enable = true;
  services.logind.lidSwitch = "ignore";
  services.logind.lidSwitchExternalPower = "ignore";
  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "caiog";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  systemd.sleep.extraConfig = ''
    AllowSuspend=no
    AllowHibernation=no
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
  '';

}
