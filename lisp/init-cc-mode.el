;; -*- coding:utf-8 -*-

(use-package cc-mode
  :mode
  (("\\.c\\'" . c-mode)
   ("\\.cpp\\'" . c++-mode)
   ("\\.h\\'" . c++-mode))

  :bind
  (:map
   c++-mode-map
   ("C-c M-o" . ff-find-related-file)
   :map
   c-mode-map
   ("C-c M-o" . ff-find-related-file))

  :init
  (defun c-mode-common-hook-func()
    "hook func for c mode"
    (aggressive-indent-mode)
    (highlight-symbol-mode)
    (highlight-symbol-nav-mode)
    (display-margin-line-number))

  (add-hook 'c-mode-common-hook 'c-mode-common-hook-func)

  :config
  ;; set default style to linux style
  (setq-default c-default-style "linux")

  ;; controls the operation of the TAB key
  (setq-default c-tab-always-indent nil)

  (setq-default c-basic-offset 4)
  (c-set-offset 'innamespace 0)
  )

(provide 'init-cc-mode)
;;; init-cc-mode.el ends here
