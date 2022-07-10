
(use-package css-mode
  :mode ("\\.qss\\'" . css-mode)
  :config
  ;; indent use 2 spaces in css-mode
  (setq-default css-indent-offset 2))

(provide 'init-css-mode)
