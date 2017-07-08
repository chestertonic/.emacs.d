;;; private/slinkee/init.el -*- lexical-binding: t; -*-

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
  (add-hook! '(c++-mode-hook c-mode-hook objc-mode-hook) #'+slinkee|init-irony-mode) nil
  :post-config
  (add-hook! 'irony-mode-hook #'irony-cdb-autosetup-compile-options) t)
