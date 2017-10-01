

;;(use-package elisp-mode)

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (setq tab-always-indent nil)
            (setq tab-width 2)))

(defun byte-compile-init-dir ()
  "Byte-compile all your lisp files."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))

(defun remove-elc-on-save ()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil
            t))

(add-hook 'emacs-lisp-mode-hook 'remove-elc-on-save)

;; init elisp mode ends here
(provide 'init-elisp-mode)
