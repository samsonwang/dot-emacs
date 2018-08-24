

(use-package js-mode
  :init
  (defun js-mode-hook-func()
    "hook func for js mode"
    (highlight-symbol-mode)
    (linum-mode))
  
  (add-hook 'js-mode-hook #'js-mode-hook-func)
  
  ;; indent use 2 spaces in js-mode
  (setq-default js-indent-level 2)
  
  )

(provide 'init-js-mode)

