

(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(provide 'init-exec-path-from-shell)
;; init-exec-path-from-shell ends here

