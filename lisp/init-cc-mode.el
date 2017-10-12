;; -*- coding:utf-8 -*-


(use-package cc-mode
  :mode (("\\.c\\'" . c-mode) ("\\.cpp\\'" . cc-mode))
  :init
  (add-hook 'c-mode-common-hook 'c-mode-common-hook-func)
  )

(defun c-mode-common-hook-func()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (setq c-default-style "linux"))

;;===============================================================
;;  Google C++ style guide
;;===============================================================
;;(load "google-style-guide.el")
;;(add-hook 'c-mode-common-hook 'google-set-c-style)
;;(add-hook 'c-mode-common-hook 'google-make-newline-indent)


(provide 'init-cc-mode)
;;; init-cc-mode.el ends here

