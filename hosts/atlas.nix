{ config, pkgs, ... }:

{
imports = [
  ./hardware-configuration.nix   
   ];


boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
    

time.timeZone = "Asia/Tashkent";
i18n.defaultLocale = "en_US.UTF-8";

fonts = {
enableDefaultPackages = true;
fontconfig.enable = true;
};

nixpkgs.config.allowUnfree = true;


  nix.settings = {
    substituters = [ "https://cache.nixos.org" ];
    trusted-public-keys = [ "cache.nixos.org-1:LfQJbNa3Y2Sb+w6G8H9hTf6LgNfK3RM7um6KFB2z3nM=" ];
  };

nix.settings.experimental-features = [ "nix-command" "flakes" ];



boot.loader.grub.enable = true;
boot.loader.grub.efiSupport = false;
boot.loader.grub.device = "/dev/nvme0n1"; 

services.mysql.enable = false;
services.mysql.package = pkgs.mysql80;

{
  virtualisation.docker.enable = true;

  # (Необязательно) добавить пользователя в группу docker
  users.users.<имя_пользователя>.extraGroups = [ "docker" ];
}


services.upower.enable = true;

zramSwap = {
enable = true;
memoryPercent = 50; };

environment.systemPackages = with pkgs; [
	docker
	imagemagick
	upower
	usbutils
	pkgs.xorg.setxkbmap
	koreader
	wget
	fprintd
	neovim
	btop
	pkgs.pulsemixer
	pkgs.pamixer
	kitty
	xorg.xev
	bspwm
	sxhkd
	flameshot
	polybar
	picom
	feh
	librewolf
	bibata-cursors
	git
	fastfetch
	tree
	rustc
	cargo
	
	mariadb
	gcc
	jdk17
	cryptsetup
	networkmanager
	clang
	emacs-nox
	networkmanager_dmenu
	
];

system.stateVersion = "24.11";
security.rtkit.enable = true;
services.printing.enable = true;
}
