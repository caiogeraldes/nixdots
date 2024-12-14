{ pkgs, ...}:
{

  environment.systemPackages = with pkgs; [
    qmk
    qmk_hid
    qmk-udev-rules
    keymapviz
  ];
}
