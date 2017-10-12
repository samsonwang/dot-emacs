

(use-package emacs-lisp-mode
  :interpreter
  ("emacs" . emacs-lisp-mode)
  :init
  (add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-hook-func)
  :config
  (setq tab-always-indent nil)
  (setq tab-width 2))


(defun emacs-lisp-mode-hook-func()
  "If you're saving an elisp file, likely the .elc is no longer valid."
  (add-hook 'after-save-hook
            (lambda ()
              (if (file-exists-p (concat buffer-file-name "c"))
                  (delete-file (concat buffer-file-name "c"))))
            nil t)
  )


(defun byte-compile-init-dir ()
  "Byte-compile all your lisp files."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))


;; init elisp mode ends here
(provide 'init-elisp-mode)

