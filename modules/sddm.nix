{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    (catppuccin-sddm.override {
      flavor = "latte";
      font  = "Mononoki Nerd Font";
      fontSize = "11";
      background = "${../assets/the_biglin_brothers_racing_1953.7.1.jpg}";
      loginBackground = true;
    })
  ];
}
