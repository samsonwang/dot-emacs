

(use-package js
  :mode ("\\.js\\'" . js-mode)
  :interpreter ("js" . js-mode)
  :init
  (defun js-mode-hook-func()
    "hook func for js mode"
    (highlight-symbol-mode)
    (highlight-symbol-nav-mode)
    (display-margin-line-number))

  (add-hook 'js-mode-hook #'js-mode-hook-func)

  ;; indent use 2 spaces in js-mode
  (setq-default js-indent-level 2)

  )

(provide 'init-js-mode)
