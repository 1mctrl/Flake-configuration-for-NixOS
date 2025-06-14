
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

#  fileSystems."/" =
 #  { device = "/dev/disk/by-uuid/fd57bb6e-a298-4413-a5fc-316f31ef4698";
  #    fsType = "ext4";
  #  };

  boot.initrd.luks.devices."luks-0279234d-0e2c-4c97-923b-c45126d4da09".device = "/dev/disk/by-uuid/0279234d-0e2c-4c97-923b-c45126d4da09";




  networking.useDHCP = lib.mkDefault true;


  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
