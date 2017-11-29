

(require 'use-package)

;; required helm for integration
;; (require 'init-helm)

(use-package projectile
  :after (helm)
  :bind
  (("C-c p f"  . helm-projectile)
   ("C-c p p"  . helm-projectile-switch-to-project)
   )
  
  :config
  (projectile-mode)
  )


(provide 'init-projectile)
;; init-projectile.el ends here

