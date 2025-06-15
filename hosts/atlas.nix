{ config, pkgs, ... }:

{
imports = [
  ./hardware-configuration.nix   
   ];


boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;


boot.initrd.secrets = {
  "/crypto_keyfile.bin" = "/etc/nixos/crypto_keyfile.bin";
};

boot.initrd.luks.devices."luks-0279234d-0e2c-4c97-923b-c45126d4da09" = {
  device = "/dev/disk/by-uuid/0279234d-0e2c-4c97-923b-c45126d4da09";
  keyFile = "/crypto_keyfile.bin";
};

fileSystems."/" = {
  device = "/dev/mapper/luks-0279234d-0e2c-4c97-923b-c45126d4da09";
  fsType = "ext4";
};

    

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


  virtualisation.docker.enable = true;


  users.users.atlas.extraGroups = [ "docker" ];



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
	rofi	
	mariadb
	gcc
	jdk17
	cryptsetup
	networkmanager
	clang
	networkmanager_dmenu
	
];

system.stateVersion = "24.11";
security.rtkit.enable = true;
services.printing.enable = true;
}
