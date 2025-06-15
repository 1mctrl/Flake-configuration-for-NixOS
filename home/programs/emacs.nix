{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacs
    fd
    ripgrep
  ];

  home.file.".doom.d/config.el".text = ''
    (setq user-full-name "atlas"
          user-mail-address "user@example.com")



    (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))


    (setq doom-theme 'doom-one)
    (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))
    (setq-default default-directory "~/")
    (setq display-line-numbers-type 'relative)
  '';

  home.file.".doom.d/init.el".text = ''
    (doom!
     :completion
	doom-dashboard  
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
