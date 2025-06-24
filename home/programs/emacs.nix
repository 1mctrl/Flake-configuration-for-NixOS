{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    pkg-config
    gcc
    gnumake
    emacs-gtk
    fd
    ripgrep
    pkgs.nerd-fonts.jetbrains-mono
    nodejs
    tdlib
    alejandra
  ];

  home.file.".doom.d/config.el".text = ''
    (setq user-full-name "atlas"
          user-mail-address "kefirzefir523@gmail.com")

   (setq doom-theme 'doom-one)
   (set-face-background 'default "#000000")

    (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 10))

    (setq-default default-directory "~/")
    (setq display-line-numbers-type 'relative)

    (setq telega-server-libs-prefix "/nix/store/8dl2snrlm20h28nqvf2rx4j8mq49yyn2-tdlib-1.8.49" )

    (use-package! telega
  :commands (telega)
  :config
  (setq telega-chat-fill-collum 80)
)

'';

  home.file.".doom.d/init.el".text = ''
    (doom!
     :completion
     oom-dashboard  
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
     :app
     telega
     :config
     (default +bindings +smartparens))
  '';

  home.file.".doom.d/packages.el".text = ''
    (package! telega)
  '';
}
