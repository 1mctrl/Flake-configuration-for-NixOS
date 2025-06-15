{ config, pkgs, ... }:

{
  home.username = "atlas";
  home.homeDirectory = "/home/atlas";
  home.stateVersion = "24.11";

  imports = [
    ./programs/fish.nix
    ./programs/bspwm.nix
    ./programs/sxhkd.nix
    ./programs/xinit.nix    
    ./programs/picom.nix 
    ./programs/fetch.nix
    ./programs/emacs.nix


 ];

  home.packages = with pkgs; [ feh  sxhkd  kitty picom ];
}
