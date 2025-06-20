{ config, pkgs, lib, ... }:

{
  imports = [];

  config = {
#    networking.hostName = "alternative"; # Можешь убрать или заменить на свой

    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_16;
      dataDir = "/var/lib/postgresql/16";
      authentication = lib.mkForce ''
        local all all trust
        host all all 127.0.0.1/32 trust
      '';
      initialScript = builtins.toFile "init.sql" ''
      CREATE ROLE atlas WITH LOGIN PASSWORD '123098'
      CREATE DATABASE mydb OWNER atlas
    '';
    };

    environment.systemPackages = with pkgs; [ postgresql_16 ];

    system.stateVersion = "24.11"; # Версия системы, корректируй под свою
  };
}
