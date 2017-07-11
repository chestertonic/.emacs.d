;;; private/slinkee/autoload/evil.el -*- lexical-binding: t; -*-

;;;###autoload (autoload '+slinkee:multi-next-line "private/hlissner/autoload/evil" nil t)
(evil-define-motion +slinkee:multi-next-line (count)
  "Move down 6 lines."
  :type line
  (let ((line-move-visual (or visual-line-mode (derived-mode-p 'text-mode))))
    (evil-line-move (* 6 (or count 1)))))

;;;###autoload (autoload '+slinkee:multi-previous-line "private/hlissner/autoload/evil" nil t)
(evil-define-motion +slinkee:multi-previous-line (count)
  "Move up 6 lines."
  :type line
  (let ((line-move-visual (or visual-line-mode (derived-mode-p 'text-mode))))
    (evil-line-move (- (* 6 (or count 1))))))

;;;###autoload (autoload '+slinkee:cd "private/hlissner/autoload/evil" nil t)
(evil-define-command +slinkee:cd ()
  "Change `default-directory' with `cd'."
  (interactive "<f>")
  (cd input))

;;;###autoload (autoload '+slinkee:kill-all-buffers "private/hlissner/autoload/evil" nil t)
(evil-define-command +slinkee:kill-all-buffers (&optional bang)
  "Kill all buffers. If BANG, kill current session too."
  (interactive "<!>")
  (if bang
      (+workspace/kill-session)
    (doom/kill-all-buffers)))

;;;###autoload (autoload '+slinkee:kill-matching-buffers "private/hlissner/autoload/evil" nil t)
(evil-define-command +slinkee:kill-matching-buffers (&optional bang pattern)
  "Kill all buffers matching PATTERN regexp. If BANG, only match project
buffers."
  (interactive "<a>")
  (doom/kill-matching-buffers pattern bang))
