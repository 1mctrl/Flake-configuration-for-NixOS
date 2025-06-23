{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
gnumake
    emacs
  fd
  ripgrep
 (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" "NerdFontsSymbolsOnly" ]; })
nixfmt
  nodejs
tdlib
 alejandra
  ];

  home.file.".doom.d/config.el".text = ''
    (setq user-full-name "atlas"
          user-mail-address "user@example.com")

   (setq doom-theme 'doom-one)
(set-face-background 'default "#000000") 


    (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))


    (setq doom-theme 'doom-one)
    (setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 14))
    (setq-default default-directory "~/")
    (setq display-line-numbers-type 'relative)

(use-package! telega
  :commands (telega)
  :config
  (setq telega-server-libs-prefix "/nix/store/pzva4adbg5pdgifj76zpx31xf1jikr0z-tdlib-1.8.39"


      telega-chat-fill-collum 80)
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
