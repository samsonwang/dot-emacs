
(use-package server
  :if (daemonp)
  :config
  ;; Suppress error "director ~/.emacs.d/server is unsafe"
  ;; on windows.
  (when *windows*
    (defun server-ensure-safe-dir (dir)
      "Noop" t)
    )
  :custom
  (server-auth-dir user-emacs-cache))

(provide 'init-server)
