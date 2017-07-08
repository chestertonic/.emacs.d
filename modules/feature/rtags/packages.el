;; -*- no-byte-compile: t; -*-
;;; feature/rtags/packages.el

(package! rtags)
;; Ivy-rtags may not be for navigation...we'll have
;; to see. Let's start with just getting rtags set.
;;(when (featurep! :completion ivy)
;;  (package! ivy-rtags))
;; Irony is set up for completion and syntax checking
;; As far as I know irony is the better choice for
;; completion/syntax-checking but lacks navigation.
;; That's what rtags/ivy-rtags is for. But I may
;; just use rtags if I find that completion/syntax
;; checking is just as good as irony.
;; (when (featurep! :completion company)
;;   (package! company-rtags))
;; (when (featurep! :feature syntax-checker)
;;   (package! flycheck-rtags))
