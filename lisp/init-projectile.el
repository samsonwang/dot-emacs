

(require 'use-package)

(use-package helm-projectile
  :after
  (helm projectile)
  
  :bind
  (("C-c p f"  . helm-projectile)
   ("C-c p p"  . helm-projectile-switch-project)
   ("C-c p e"  . helm-projectile-recentf)
   ("C-c p i"  . projectile-invalidate-cache)
   )
  
  :config
  (custom-set-variables
   '(projectile-completion-system 'helm))
  
  (projectile-global-mode)
  (helm-projectile-on)

  )


(provide 'init-projectile)
;; init-projectile.el ends here

