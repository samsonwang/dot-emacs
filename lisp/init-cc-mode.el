;; -*- coding:utf-8 -*-




(add-hook 'c-mode-hook
		  (lambda()
			(setq-default indent-tabs-mode nil)
			(setq c-basic-offset 4)
			(setq tab-width 4)
			(setq c-default-style "linux")))


;;===============================================================
;;  Google C++ style guide
;;===============================================================
;;(load "google-style-guide.el")
;;(add-hook 'c-mode-common-hook 'google-set-c-style)
;;(add-hook 'c-mode-common-hook 'google-make-newline-indent)


(provide 'init-cc-mode)
;;; init-cc-mode.el ends here

