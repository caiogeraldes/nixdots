{ config, pkgs, inputs, ... }:
{
  imports = [ 
    ./hypr/lock.nix 
    ./hypr/land.nix
    ./hypr/paper.nix
  ];
}
