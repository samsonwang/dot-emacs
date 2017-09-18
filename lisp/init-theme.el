
;; -*- coding:utf-8 -*-

;; Enable theme
(when (eq system-type 'windows-nt)

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


(if (display-graphic-p)
  ;; hide toolbar scrollbar in graphical display
  ((lambda()
    (tool-bar-mode 0)
    (scroll-bar-mode 0)))
  ;; Hide menu-bar in command line
  (menu-bar-mode 0))


(provide 'init-theme)
;;; init-theme.el ends here

