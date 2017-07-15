;;; private/hlissner/init.el -*- lexical-binding: t; -*-

(setq user-mail-address "chestertonic@gmail.com"
      user-full-name "Chester Tonic")

(def-package-hook! company
  :post-config
  (setq company-idle-delay 0.5
        company-minimum-prefix-length 3) t)

(def-package-hook! irony
  :post-init
  (defun +slinkee|init-irony-mode ()
    (when (file-directory-p irony-server-install-prefix)
        (irony-mode +1)))
  (add-hook! '(c++-mode-hook c-mode-hook objc-mode-hook) #'+slinkee|init-irony-mode) nil)

(def-package-hook! irony
  :post-config
  (require 'irony-cdb)
  (add-hook! 'irony-mode-hook #'irony-cdb-autosetup-compile-options) t)

(def-package! meson-mode
  :init
  (add-hook 'meson-mode-hook #'company-mode))

(setq doom-font (font-spec :family "Consolas for Powerline" :size 13)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13)
      doom-unicode-font (font-spec :family "DejaVu Sans Mono" :size 13))
