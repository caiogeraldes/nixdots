{ config, pkgs, inputs, ... }:
with pkgs;
{
  environment.systemPackages = with pkgs; [
    pecita
    ((texlive.combine {
      inherit (texlive) scheme-full;
      pkgFilter = pkg: lib.elem pkg.tlType [ "run" "bin" "doc" ];
    }).override (args: { ignoreCollisions = true; }))
  ];
}
