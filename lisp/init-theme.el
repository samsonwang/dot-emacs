
;; -*- coding:utf-8 -*-

;; Enable theme
(when *windows*

  ;;(load "autumn-light-theme.el")
  ;;(load-theme 'autumn-light t)

  (load "dracula-theme.el")
  (load-theme 'dracula t)

  ;; Set initial window size
  (setq initial-frame-alist
		(append '((width . 90) (height . 35)
	      (left . 490) (top . 5))
	      initial-frame-alist))

  ;; Set default subsequent window size
  (setq default-frame-alist
		(append '((width . 80) (height . 30)) default-frame-alist))
  )


;; hide toolbar and scrollbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode 0))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode 0))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode 0))

;; hide menubar in commandline
(when (not (display-graphic-p) )
  (menu-bar-mode 0))

(provide 'init-theme)
;;; init-theme.el ends here

