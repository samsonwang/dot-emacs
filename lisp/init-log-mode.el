
(use-package log-mode
  :load-path "site-lisp/log-mode"
  :init
  (defun log-mode-hook-func ()
    "hook func for log mode"
    (auto-revert-mode)
    (make-variable-buffer-local 'auto-revert-verbose)
    (setq auto-revert-verbose nil)
    (make-variable-buffer-local 'auto-revert-interval)
    (setq auto-revert-interval 1)
    (auto-revert-set-timer)

    ;; (end-of-buffer)
    (toggle-truncate-lines nil)
    (hl-line-mode))

  (add-hook 'log-mode-hook #'log-mode-hook-func)

  ;; :config

  ;;:custom
  ;; no littering

  )

(provide 'init-log-mode)
