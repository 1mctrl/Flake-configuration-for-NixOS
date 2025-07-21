{ config, pkgs, lib, ... }:

let
  kernel = config.boot.kernelPackages.kernel;
  rtl8188euDrv = pkgs.stdenv.mkDerivation {
    pname = "rtl8188eu";
    version = "unstable";

    src = pkgs.fetchFromGitHub {
      owner = "lwfinger";
      repo = "rtl8188eu";
      rev = "HEAD"; # можно указать конкретный коммит
      sha256 = "0000000000000000000000000000000000000000000000000000"; # будет ошибка с актуальной хеш-суммой
    };

    nativeBuildInputs = with pkgs; [ config.boot.kernelPackages.kernel.dev config.boot.kernelPackages.kernelHeaders pkgs.git ];

    buildPhase = ''
      make ARCH=x86_64 KSRC=${kernel.dev}/lib/modules/${kernel.modDirVersion}/build
    '';

    installPhase = ''
      mkdir -p $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless
      cp 8188eu.ko $out/lib/modules/${kernel.modDirVersion}/kernel/drivers/net/wireless/
    '';

    meta = {
      description = "Realtek RTL8188EU driver";
      license = lib.licenses.gpl2;
    };
  };
in {
  boot.extraModulePackages = [ rtl8188euDrv ];
}
