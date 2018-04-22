

(use-package exec-path-from-shell
  :if
  (memq window-system '(mac ns x))
  :config
  (exec-path-from-shell-initialize))

(provide 'init-exec-path-from-shell)
;; init-exec-path-from-shell ends here

