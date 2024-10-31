{pkgs, ...}:
 {
  home.packages = with pkgs; [
    zathura
    sioyek
    pftk
    poppler_utils
    ocrmypdf
    tesseract4
    pdf4qt
  ];
}
