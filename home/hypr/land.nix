{ ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = ''
      env = XCURSOR_THEME,Nordzy-cursors
      env = XCURSOR_SIZE,24
      env = HYPRCURSOR_SIZE,24
    '';
    settings = {
      "$mainMod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";
      "$terminal" = "kitty";
      "$fileManager" = "kitty -e yazi";
      "$menu" = "rofi";
      "exec-once" = 
        [
        "waybar & hyprpaper & avizo-service & systemctl --user start plasma-polkit-agent & blueman-applet"
        "wl-paste --watch cliphist store"
        ];
# exec-once = wl-paste --type image --watch cliphist store # Stores only image data
      general = { 
          gaps_in = 5;
          gaps_out = 20;
          border_size = 4;
          "col.active_border" =  "rgba(89b482ee) rgba(7daea3ee) 45deg"; # #89b482 #7daea3
          "col.inactive_border" = "rgba(928374aa)"; # #928374
          resize_on_border = true;
          allow_tearing = false;
          layout = "master";
      };
      decoration  = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation =  [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
          ];
      };
      gestures = {
        workspace_swipe = true;
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };
      input = {
        kb_layout = "br,gr,us";
        kb_variant = ",polytonic,";
        kb_options = "grp:win_space_toggle";

        touchpad = {
          natural_scroll = false;
        };
      };
      bind = [
        "$mainMod, RETURN, exec, $terminal"
        "$shiftMod, Q, killactive,"
        "$shiftMod, X, exec, leave"
        "$shiftMod, L, exec, hyprlock"
        "$mainMod, F2, exec, zen"
        "$shiftMod, F2, exec, zen -P medeixa"
        "$mainMod, F3, exec, $fileManager"
        "$mainMod, F4, exec, zen --private-window"
        "$mainMod, V, togglefloating,"
        "$mainMod, D, exec, $menu -modi drun,run,window,filebrowser -show drun -sidebar-mode"
        "$mainMod, O, exec, $menu -modi drun,run,window,filebrowser -show filebrowser -sidebar-mode"
        "$mainMod, T, exec, $HOME/.scripts/texdocer"
        "$mainMod, M, exec, GDK_DPI_SCALE=1.3 dopamine"
        "$mainMod CTRL, P, exec, playerctl play-pause"
        "$mainMod, A, exec, audiomenu select-sink"
        "$mainMod, R, exec, rofi -show ssh"
        "$shiftMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        # Layout
        "$mainMod, L, layoutmsg, swapnext"
        "$mainMod, K, layoutmsg, orientationcycle left top center"
        "$mainMod, J, layoutmsg, mfact +0.1"
        "$mainMod, H, layoutmsg, mfact -0.1"
        "$shiftMod, J, layoutmsg, mfact +0.02"
        "$shiftMod, H, layoutmsg, mfact -0.02"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Printscreen
        "$mainMod, P, exec, grimmer"
        "$mainMod SHIFT, P, exec, grimmer region"
      ];
      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
      bindel = [
        # # Laptop multimedia keys for volume and LCD brightness
        # ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        # ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        # ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        # ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        # ",XF86MonBrightnessUp, exec, brightnessctl s 5%+"
        # ",XF86MonBrightnessDown, exec, brightnessctl s 5%- -n15"
        # Avizo
        ",XF86AudioRaiseVolume, exec, volumectl -u up"
        ",XF86AudioLowerVolume, exec, volumectl -u down"
        ",XF86AudioMute, exec, volumectl toggle-mute"
        ",XF86AudioMicMute, exec, volumectl -m toggle-mute"
        ",XF86MonBrightnessUp, exec, lightctl up"
        ",XF86MonBrightnessDown, exec, lightctl down"
      ];
      windowrulev2 = "suppressevent maximize, class:.*"; # You'll probably like this.
      # windowrule = [ "tile, ^(R_x11)$" ];
      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}

