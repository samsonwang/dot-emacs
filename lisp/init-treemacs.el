
(require 'use-package)

(use-package treemacs
  :defer t
  :bind
  ("C-c t e" . treemacs-toggle)
  
  :config
  (setq treemacs-width 30)
  )

(use-package treemacs-projectile
  :defer t
  :bind
  ("C-c t p" . treemacs-projectile-toggle)
  :config
  (setq treemacs-header-function 'treemacs-projectile-create-header)
  )

(provide 'init-treemacs)
;; init-treemacs ends here

