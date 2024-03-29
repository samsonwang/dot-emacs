
(use-package log-mode
  :load-path "lisp-site/log-mode"
  :init
  (defun log-mode-hook-func ()
    "hook func for log mode"
    (auto-revert-mode)
    ;; (make-variable-buffer-local 'auto-revert-verbose)
    (setq auto-revert-verbose nil)
    ;; (make-variable-buffer-local 'auto-revert-interval)
    (setq auto-revert-interval 1)
    (auto-revert-set-timer)

    (setq truncate-lines t)
    ;; (toggle-truncate-lines nil)

    ;; (end-of-buffer)
    (hl-line-mode))

  (add-hook 'log-mode-hook #'log-mode-hook-func)

  ;; :config

  ;;:custom
  ;; no littering

  )

(provide 'init-log-mode)
