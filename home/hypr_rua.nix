{ config, pkgs, inputs, ... }:
{
  imports = [ 
    ./hypr/lock.nix 
    ./hypr/land_rua.nix
    ./hypr/paper.nix
  ];
}
