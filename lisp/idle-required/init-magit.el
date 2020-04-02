

(use-package magit
  :if (executable-find "git")
  :diminish auto-revert-mode
  :init
  ;; magit requires server.el
  ;; put server auth file in cache directory
  (custom-set-variables
   '(server-auth-dir (concat user-emacs-cache "server/")))

  :bind
  (("C-c g s" . magit-status)
   ("C-c g g" . magit-dispatch-popup))

  )

(provide 'init-magit)
