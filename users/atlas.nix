{ config, pkgs, ... }:


{
users.users.atlas = {
isNormalUser = true;
description = "atlas";
extraGroups = [ "networkmaneger" "wheel" ];
shell = pkgs.fish;
packages = with pkgs; [ 
 	librewolf
 	bspwm
	docker 	 
	spotify 
 	
 	telegram-desktop 
	libreoffice 
 	cmake
 	freecad
	blender
 	mariadb
 	dbus


	zip

 	unzip
 	brightnessctl
	pavucontrol
 	networkmanagerapplet
 	networkmanager_dmenu
 
 ];
};





programs.fish.enable = true;
}
