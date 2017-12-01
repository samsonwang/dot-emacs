;; -*- coding:utf-8 -*-


(use-package cc-mode
  :mode
  (("\\.c\\'" . c-mode)
   ("\\.cpp\\'" . c++-mode)
   ("\\.h\\'" . c++-mode))
  :init
  
  (defun c-mode-common-hook-func()
    "hook func for c mode"
    (linum-mode)
    (setq indent-tabs-mode nil)
    (setq c-basic-offset 4)
    (setq tab-width 4)
    (setq c-default-style "linux"))
  
  (add-hook 'c-mode-common-hook 'c-mode-common-hook-func)
  :bind
  (:map
   c++-mode-map
   ("C-c M-o" . ff-find-related-file)
   :map
   c-mode-map
   ("C-c M-o" . ff-find-related-file)
   )
  )

;;===============================================================
;;  Google C++ style guide
;;===============================================================
;;(load "google-style-guide.el")
;;(add-hook 'c-mode-common-hook 'google-set-c-style)
;;(add-hook 'c-mode-common-hook 'google-make-newline-indent)


(provide 'init-cc-mode)
;;; init-cc-mode.el ends here

