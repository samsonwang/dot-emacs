
(use-package go-mode
  :init
  (defun go-mode-hook-func()
    "hook func for go mode"
    ;; (aggressive-indent-mode)
    (highlight-symbol-mode)
    (highlight-symbol-nav-mode)
    (display-margin-line-number))

  (add-hook 'go-mode-hook 'go-mode-hook-func)

  )

(provide 'init-go-mode)
