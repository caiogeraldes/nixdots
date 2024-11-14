{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
  samba
  ];
services.gvfs.enable = true;
}
