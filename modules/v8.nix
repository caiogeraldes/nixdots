{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    v8
  ];
}
