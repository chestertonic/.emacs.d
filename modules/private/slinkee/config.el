;;; private/slinkee/config.el -*- lexical-binding: t; -*-

;; Enable auto completion popup. This is disabled by
;; default. I may enable this for specific modes in
;; the future.

(when (featurep 'evil)
  (load! +bindings))


(defvar +slinkee-dir
  (file-name-directory load-file-name))
;;
