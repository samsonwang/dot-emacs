
(use-package smex
  :bind
  ("C-c M-x" . helm-smex-major-mode-commands)
  :config
  (smex-initialize)
  (require 'helm-smex)
  :custom
  (smex-save-file (expand-file-name "smex-items" user-emacs-cache)))

;; init-smex ends here
(provide 'init-smex)
