;; -*- coding:utf-8 -*-

(use-package cc-mode
  :diminish aggressive-indent-mode
  :mode
  (("\\.c\\'" . c-mode)
   ("\\.cpp\\'" . c++-mode)
   ("\\.h\\'" . c++-mode))

  :init
  (defun c-mode-common-hook-func()
    "hook func for c mode"
    (aggressive-indent-mode)
    (highlight-symbol-mode)
    (linum-mode))

  (add-hook 'c-mode-common-hook 'c-mode-common-hook-func)

  :bind
  (:map
   c++-mode-map
   ("C-c M-o" . ff-find-related-file)
   :map
   c-mode-map
   ("C-c M-o" . ff-find-related-file))

  :config
  ;; set default style to linux style
  (setq-default c-default-style "linux")

  ;; controls the operation of the TAB key
  (setq-default c-tab-always-indent nil)

  (setq-default c-basic-offset 4))

(provide 'init-cc-mode)
;;; init-cc-mode.el ends here
