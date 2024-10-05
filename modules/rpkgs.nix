{ config, pkgs, inputs, ... }:
with pkgs;
let
  R-with-my-packages = rWrapper.override{ 
    packages = with rPackages; [ 
      ggplot2 dplyr xts 
      tidyverse
      openssl
      devtools
      xml2
      usethis
      git2r
      rnaturalearth
      rnaturalearthdata
      coda
      MASS
      mvtnorm
      loo
    ]; 
  };
in {
  environment.systemPackages = [
    pkgs.cmdstan
    R-with-my-packages
  ];
}
