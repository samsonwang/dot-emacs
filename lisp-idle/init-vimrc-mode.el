
(use-package vimrc-mode
  :load-path "site-lisp/vimrc-mode"
  :mode ("\\.*vim\\(rc\\)?\\'" . vimrc-mode)
  :init
  (defun vimrc-mode-hook-func()
    "hook func for vimrc mode"
    ;; (aggressive-indent-mode)
    ;; (highlight-symbol-mode)
    ;; (highlight-symbol-nav-mode)
    (display-margin-line-number))
  (add-hook 'vimrc-mode-hook #'vimrc-mode-hook-func))

(provide 'init-vimrc-mode)
