{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    v8
  ];
}
