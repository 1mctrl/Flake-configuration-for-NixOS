{ config, pkgs, ... }:

{
  xdg.configFile."picom/picom.conf" = {
    text = ''
backend = "xrender";

vsync = true
unredir-if-possible = false
detect-client-opacity = true
use-damage = true


shadow = true
shadow-radius = 6
shadow-offset-x = -6
shadow-offset-y = -6
shadow-opacity = 0.3
shadow-exclude = [
  "class_g = 'Polybar'",
  "name = 'Notification'",
  "name = 'Picture-in-Picture'",
  "class_g = 'Conky'",
  "_GTK_FRAME_EXTENTS@:c"
]


inactive-opacity =0.9
active-opacity = 0.9
frame-opacity = 0
inactive-opacity-override = false


blur-background = false
blur-background-fixed = false
blur-background-exclude = []


corner-radius = 0


fading = true
fade-in-step = 0.05
fade-out-step = 0.05
fade-exclude = []

log-level = "warn"


    '';
  executable = true;    
  };

}




