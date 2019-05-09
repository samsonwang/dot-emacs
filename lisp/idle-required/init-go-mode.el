
(use-package go-mode
  :init
  (defun go-mode-hook-func()
    "hook func for go mode"
    ;;    (aggressive-indent-mode)
    (highlight-symbol-mode)
    (linum-mode))

  (add-hook 'go-mode-hook 'go-mode-hook-func)

  )

(provide 'init-go-mode)