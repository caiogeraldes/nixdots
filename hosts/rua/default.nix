# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/ssh.nix
      ../../modules/sddm.nix
      ../../modules/swap.nix
      ../../modules/aesthetics.nix
      ../../modules/rpkgs.nix
      ../../modules/tex.nix
      ../../modules/samba.nix
      ../../modules/intel_video.nix
      ../../modules/battery.nix
      ../../modules/audio.nix
      ../../modules/bluetooth.nix
      ../../modules/network.nix
      ../../modules/blocky.nix
    ];

  nixpkgs.config.permittedInsecurePackages = [
    "v8-9.7.106.18"
    "qbittorrent-4.6.4"
  ];

  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  
  boot.loader = {
      efi = {
        canTouchEfiVariables = true;
        # assuming /boot is the mount point of the  EFI partition in NixOS (as the installation section recommends).
        efiSysMountPoint = "/boot";
      };
      grub = {
        # despite what the configuration.nix manpage seems to indicate,
        # as of release 17.09, setting device to "nodev" will still call
        # `grub-install` if efiSupport is true
        # (the devices list is not used by the EFI grub install,
        # but must be set to some value in order to pass an assert in grub.nix)
        devices = [ "nodev" ];
        efiSupport = true;
        enable = true;
        configurationLimit = 5;
        default = "saved";
        # extraEntries = "GRUB_SAVEDEFAULT=true";
        extraEntries = ''
          GRUB_SAVEDEFAULT=true 
	  menuentry "Windows" {
	    insmod part_gpt 
	    insmod fat
	    insmod search_fs_uuid
	    insmod chain
	    search --fs-uuid --set=root A8A2-9611
	    chainloader /EFI/Microsoft/Boot/bootmgfw.efi
	    }
	'';
      };
    };
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
    packages = [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    inputs.neovim-nightly-overlay.packages.${pkgs.system}.default
    # neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    obsidian
    curl
    git
    kitty
    wofi
    fzf
    nerdfonts
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
    R
    cargo
    cargo-update
    mercurial
    luarocks
    imv
    tree-sitter
    lua
    killall
    brightnessctl
    openssl
    calibre
    hyprland
    just
    texliveFull
    inputs.zen-browser.packages."${system}".specific
    qbittorrent
    libreoffice
    intel-gpu-tools
    nodejs_23
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
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

  programs.hyprland = {
    enable = true;
    # set the flake package
    # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    # make sure to also set the portal package, so that they are in sync
    # portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
  };
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "catppuccin-latte";
    package = pkgs.kdePackages.sddm;
  };

  
  programs.nix-ld.enable = true;
  environment.pathsToLink = [ "/share/zsh" ];

  # programs.nix-ld.libraries = with pkgs; [
  #   # Add any missing dynamic libraries for unpackaged programs
  #   # here, NOT in environment.systemPackages
  # ];
  networking.hostName = "nixrua"; # Define your hostname.

}
