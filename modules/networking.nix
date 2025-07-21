{ config, pkgs, ... }:
 
{
networking.hostName = "aleternative";
networking.networkmanager.enable = true;
services.openssh.enable = true;

 boot.extraModulePackages = with config.boot.kernelPackages; [ rtl8188eu ];
hardware.bluetooth.enable = true;
services.blueman.enable = true;
}
