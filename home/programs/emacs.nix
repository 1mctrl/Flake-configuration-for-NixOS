{ config, pkgs, ... }:

let
  doomDir = "${config.home.homeDirectory}/.doom.d";
in {
  home.packages = with pkgs; [
    emacs-nativecomp   # Быстрый Emacs с native compilation
    fd                 # Поиск файлов (рекомендуется для Doom)
    ripgrep            # Поиск текста (рекомендуется для Doom)
  ];

home.file.".emacs.d".source = pkgs.fetchFromGitHub {
  owner = "doomemacs";
  repo = "doomemacs";
  rev = "e6c755305358412a71a990fc2cf592c629edde1e";
  sha256 = "1f5k6mhrdcfsq1gqc0m36f1zvsi9fwi4cmrvf6jfaf3q9bpyalbg";
};


  home.file.".doom.d/config.el".text = ''
    (setq user-full-name "atlas"
          user-mail-address "user@example.com")

    ;; Общая тема интерфейса
    (setq doom-theme 'doom-one)

    ;; Увеличить шрифт
    (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))

    ;; Файлы по умолчанию открываются в текущей директории
    (setq-default default-directory "~/")

    ;; Включить относительные номера строк
    (setq display-line-numbers-type 'relative)
  '';

  home.file.".doom.d/init.el".text = ''
    (doom!
     :completion
     vertico
     company
     :ui
     doom
     modeline
     :editor
     (evil +everywhere)
     :tools
     magit
     lsp
     :lang
     (nix +lsp)
     (c +lsp)
     :config
     (default +bindings +smartparens))
  '';

  home.file.".doom.d/packages.el".text = ''
    ;; Дополнительные пакеты можешь добавлять сюда
  '';
}
