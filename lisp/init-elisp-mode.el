
(use-package emacs-lisp-mode
  :diminish aggressive-indent-mode
  :init
  (defun emacs-lisp-mode-hook-func ()
    ;; If you're saving an elisp file, likely the .elc is no longer valid.
    (add-hook 'after-save-hook
              (lambda ()
                (if (file-exists-p (concat buffer-file-name "c"))
                    (delete-file (concat buffer-file-name "c"))))
              nil t)
    (linum-mode)
    (aggressive-indent-mode)
    (setq tab-always-indent t)
    (setq tab-width 2))
  (add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-hook-func))

;; init elisp mode ends here
(provide 'init-elisp-mode)

