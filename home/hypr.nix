{ config, pkgs, inputs, ... }:
{
  imports = [ 
    ./hypr/lock.nix 
    ./hypr/land1.nix
    ./hypr/paper.nix
  ];
}
