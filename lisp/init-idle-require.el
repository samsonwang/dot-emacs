
;; idle require other stuff
(use-package idle-require
  :load-path "site-lisp/idle-require"
  :init
  (setq idle-require-idle-delay 1
        idle-require-load-break 0
        idle-require-message-verbose nil)

  (defun idle-require-start ()
    ;; idle required path
    (add-to-list 'load-path (emacs-home "lisp/idle-required"))
    (idle-require-mode +1))

  ;; start idle-require after init finish
  (add-hook 'after-init-hook #'idle-require-start))

(provide 'init-idle-require)
;; idle require ends here
