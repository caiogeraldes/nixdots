{ config, pkgs, inputs, ... }:
with pkgs;
let
  R-pkgs = with rPackages; [
    ggplot2
    dplyr
    xts 
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
    kableExtra
    FactoMineR
    V8
    dagitty
  ];
  R-with-my-packages = rWrapper.override{ 
    packages = R-pkgs;
  };
  RStudio-with-my-packages = rstudioWrapper.override{
    packages = R-pkgs;
  };
in {
  environment.systemPackages = [
    pkgs.cmdstan
    R-with-my-packages
    RStudio-with-my-packages
  ];
}
