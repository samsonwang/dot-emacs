

(require 'use-package)

(use-package projectile
  :after
  (helm helm-projectile)

  :init
  (custom-set-variables
   '(projectile-completion-system 'helm)
   '(projectile-cache-file
     (concat user-emacs-cache "projectile.cache"))
   '(projectile-known-projects-file
     (concat user-emacs-cache "projectile.bookmarks"))
   '(projectile-mode-line
     '(:eval (format " [%s]" (projectile-project-name))))
   )
  
  :bind
  (("C-c p f"  . projectile-find-file)
   ("C-c p p"  . projectile-switch-project)
;;   ("C-c p e"  . projectile-recentf)
   ("C-c p i"  . projectile-invalidate-cache)
   )
  
  :config  
;;  (projectile-global-mode)
  (projectile-mode))

(provide 'init-projectile)
;; init-projectile.el ends here

