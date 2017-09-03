
;; -*- coding:utf-8 -*-

(when (eq system-type 'windows-nt)
	(load "autumn-light-theme.el")
	(load-theme 'autumn-light t))

;; Enable theme

;;(require-theme 'autumn-light)

;; Set initial window size
(setq initial-frame-alist
     (append '((width . 90) (height . 35)
	      (left . 580) (top . 40))
	      initial-frame-alist))

;; Set default subsequent window size
(setq default-frame-alist
     (append '((width . 80) (height . 30)) default-frame-alist))


(provide 'init-theme)
;;; init-theme.el ends here
