
(require 'use-package)

(use-package helm-smex
  :after smex
  
  :init
  (custom-set-variables
   '(smex-save-file (concat user-emacs-cache "smex-items")))
  
  :bind
  ("C-c M-x" . helm-smex-major-mode-commands)

:config
  
  (smex-initialize)  
  )

;; init-smex ends here
(provide 'init-smex)

