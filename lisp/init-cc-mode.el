;; -*- coding:utf-8 -*-


(require 'use-package)

(use-package c-mode
  :commands c-mode-init
  :init
  (add-hook 'c-mode-hook 'c-mode-init)
  )

(defun c-mode-init()
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

