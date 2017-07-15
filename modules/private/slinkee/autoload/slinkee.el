;;; private/slinkee/autoload/slinkee.el -*- lexical-binding: t; -*-

;;;###autoload
(defun +slinkee/install-snippets ()
  "Install my snippets from https://github.com/slinkee/emacs-snippets into
private/slinkee/snippets."
  (interactive)
  (doom-fetch :github "slinkee/emacs-snippets"
              (expand-file-name "snippets" (doom-module-path :private 'slinkee))))

;;;###autoload
(defun +slinkee/yank-buffer-filename ()
  "Copy the current buffer's path to the kill ring."
  (interactive)
  (if-let (filename (or buffer-file-name (bound-and-true-p list-buffers-directory)))
      (message (kill-new (abbreviate-file-name filename)))
    (error "Couldn't find filename in current buffer")))

(defmacro +slinkee-def-finder! (name dir)
  "Define a pair of find-file and browse functions."
  `(progn
     (defun ,(intern (format "+slinkee/find-in-%s" name)) ()
       (interactive)
       (let ((default-directory ,dir))
         (call-interactively (command-remapping #'projectile-find-file))))
     (defun ,(intern (format "+slinkee/browse-%s" name)) ()
       (interactive)
       (let ((default-directory ,dir))
         (call-interactively (command-remapping #'find-file))))))

;;;###autoload (autoload '+slinkee/find-in-templates "private/slinkee/autoload/slinkee" nil t)
;;;###autoload (autoload '+slinkee/browse-templates "private/slinkee/autoload/slinkee" nil t)
(+slinkee-def-finder! templates +file-templates-dir)

;;;###autoload (autoload '+slinkee/find-in-snippets "private/slinkee/autoload/slinkee" nil t)
;;;###autoload (autoload '+slinkee/browse-snippets "private/slinkee/autoload/slinkee" nil t)
(+slinkee-def-finder! snippets +slinkee-snippets-dir)

;;;###autoload (autoload '+slinkee/find-in-emacsd "private/slinkee/autoload/slinkee" nil t)
;;;###autoload (autoload '+slinkee/browse-emacsd "private/slinkee/autoload/slinkee" nil t)
(+slinkee-def-finder! emacsd doom-emacs-dir)

;;;###autoload (autoload '+slinkee/find-in-notes "private/slinkee/autoload/slinkee" nil t)
;;;###autoload (autoload '+slinkee/browse-notes "private/slinkee/autoload/slinkee" nil t)
(+slinkee-def-finder! notes +org-dir)
