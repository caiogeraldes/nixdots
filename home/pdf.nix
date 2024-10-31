{pkgs, ...}:
 {
  home.packages = with pkgs; [
    zathura
    sioyek
    pdftk
    poppler_utils
    ocrmypdf
    tesseract4
    pdf4qt
  ];
}
