{ config, pkgs, inputs, ... }:
with pkgs;
{
  environment.systemPackages = with pkgs; [
    ((texlive.combine {
      inherit (texlive) scheme-full;
      pkgFilter = pkg: lib.elem pkg.tlType [ "run" "bin" "doc" ];
    }).override (args: { ignoreCollisions = true; }))
  ];
}
