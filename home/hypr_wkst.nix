{ config, pkgs, inputs, ... }:
{
  imports = [ 
    ./hypr/lock.nix 
    ./hypr/land_wkst.nix
    ./hypr/paper.nix
  ];
}
