
(require 'use-package)
(use-package helm-smex
  :after smex
  
  :init
  (smex-initialize)
  
  :bind
  ("C-c M-x" . helm-smex-major-mode-commands)
  
  )

;; init-smex ends here
(provide 'init-smex)

