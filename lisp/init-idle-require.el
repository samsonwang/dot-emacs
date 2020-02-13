
;; idle require other stuff
(use-package idle-require
  :load-path "site-lisp/idle-require"
  :init
  ;; start idle-require after init finish
  (defun after-init-hook-func ()
    (add-to-list 'load-path
                 (expand-file-name "lisp/idle-required" user-emacs-directory))
    (idle-require-mode +1))
  (add-hook 'after-init-hook #'after-init-hook-func)

  (defun idle-require-finish-hook-func ()
    (message (concat "Emacs is ready, " (startup-echo-area-message))))
  (add-hook 'idle-require-finish-hook #'idle-require-finish-hook-func)

  :custom
  (idle-require-idle-delay 1)
  (idle-require-load-break 0)
  (idle-require-message-verbose nil))

(provide 'init-idle-require)
;; idle require ends here
