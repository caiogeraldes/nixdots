{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
  samba
  ];
services.gvfs.enable = true;
}
