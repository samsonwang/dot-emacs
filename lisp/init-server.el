
(use-package server
  :if (daemonp)
  :config
  ;; Suppress error "director ~/.emacs.d/server is unsafe"
  ;; on windows.
  (when *windows*
    (defun server-ensure-safe-dir (dir)
      "Noop" t))
  )

(provide 'init-server)
