{ config, pkgs, lib, ... }:

let
  rtl8188euDrv = pkgs.stdenv.mkDerivation {
    name = "rtl8188eu";
    src = pkgs.fetchFromGitHub {
      owner = "lwfinger";
      repo = "rtl8188eu";
      rev = "master";
      sha256 = "0000000000000000000000000000000000000000000000000000"; # заменить
    };
    nativeBuildInputs = with pkgs; [ kernelPackages.kernel.dev pkgs.git ];
    buildPhase = ''
      make
    '';
    installPhase = ''
      mkdir -p $out/lib/modules/${pkgs.kernel.version}/kernel/drivers/net/wireless
      cp 8188eu.ko $out/lib/modules/${pkgs.kernel.version}/kernel/drivers/net/wireless/
    '';
  };
in {
  boot.extraModulePackages = [ rtl8188euDrv ];
}
