
;; idle require other stuff
(use-package idle-require
  :load-path "site-lisp/idle-require"
  :init
  ;; start idle-require after init finish
  (add-hook 'after-init-hook
            (lambda ()
              (progn
                ;; idle required path
                (add-to-list 'load-path (emacs-home "lisp/idle-required"))
                (idle-require-mode +1))))

  (add-hook 'idle-require-finish-hook
            (lambda ()
              (unless idle-require-message-verbose
                (message " "))))

  :custom
  (idle-require-idle-delay 1)
  (idle-require-load-break 0)
  (idle-require-message-verbose nil))

(provide 'init-idle-require)
;; idle require ends here
