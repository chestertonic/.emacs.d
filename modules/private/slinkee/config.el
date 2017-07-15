;;; private/slinkee/config.el -*- lexical-binding: t; -*-

(when (featurep 'evil)
  (load! +bindings)  ; my key bindings
  (load! +commands)) ; my custom ex commands

(defvar +slinkee-dir
  (file-name-directory load-file-name))

(defvar +slinkee-snippets-dir
  (expand-file-name "snippets/" +slinkee-dir))

(setq epa-file-encrypt-to user-mail-address
      auth-sources (list (expand-file-name ".authinfo.gpg" +slinkee-dir)))

(defun +slinkee*no-authinfo-for-tramp (orig-fn &rest args)
  "Don't look into .authinfo for local sudo TRAMP buffers."
  (let ((auth-sources (if (equal tramp-current-method "sudo") nil auth-sources)))
    (apply orig-fn args)))
(advice-add #'tramp-read-passwd :around #'+slinkee*no-authinfo-for-tramp)


(after! evil-mc
  ;; if I'm in insert mode, chances are I want cursors to resume
  (add-hook! 'evil-mc-before-cursors-created
    (add-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors nil t))
  (add-hook! 'evil-mc-after-cursors-deleted
    (remove-hook 'evil-insert-state-entry-hook #'evil-mc-resume-cursors t)))

;; Don't use default snippets, use mine.
;; (after! yasnippet
;;   (setq yas-snippet-dirs
;;         (append (list '+slinkee-snippets-dir)
;;                 (delete 'yas-installed-snippets-dir
;;                         yas-snippet-dirs))))


;; app/irc
;; (setq +irc-notifications-watch-strings '("v0" "vnought" "slinkee"))

;; (set! :irc "irc.snoonet.org"
;;   `(:tls t
;;     :nick "v0"
;;     :port 6697
;;     :sasl-username ,(+pass-get-user "irc/snoonet.org")
;;     :sasl-password ,(+pass-get-secret "irc/snoonet.org")
;;     :channels (:after-auth "#ynought")))


;; app/email
;; (setq smtpmail-stream-type 'starttls
;;       smtpmail-default-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-server "smtp.gmail.com"
;;       smtpmail-smtp-service 587)

;; (set! :email "gmail.com"
;;   '((mu4e-sent-folder       . "/gmail.com/Sent Mail")
;;     (mu4e-drafts-folder     . "/gmail.com/Drafts")
;;     (mu4e-trash-folder      . "/gmail.com/Trash")
;;     (mu4e-refile-folder     . "/gmail.com/All Mail")
;;     (smtpmail-smtp-user     . "slinkee")
;;     (user-mail-address      . "slinkee@gmail.com")
;;     (mu4e-compose-signature . "---\nChester")))
