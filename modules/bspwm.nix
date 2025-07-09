{ config, lib, pkgs, ... }:

{
  options = {
    
  };

  config = {
    services.xserver.enable = true;
    services.xserver.windowManager.bspwm.enable = true;
    services.displayManager.ly.enable = true;

    environment.systemPackages = with pkgs; [
      bspwm
      sxhkd
      dmenu
      rofi
      #polybar
      picom
    ];

    
    services.xserver.displayManager.startx.enable = true;  
  };
}
