;;; feature/rtags/config.el -*- lexical-binding: t; -*-

(def-package! rtags
:commands rtags-start-process-unless-running
:init
(add-hook! '(c-mode-hook c++-mode-hook objc-mode-hook) #'rtags-start-process-unless-running))

(def-package! ivy-rtags
  :init
  (setq rtags-display-result-backend 'ivy))
