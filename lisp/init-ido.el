
;; -*- coding:utf-8 -*-

;; Enable ido mode
(ido-mode t)

;;(ido-everywhere t)

;; Enable Ido vertical mode
(when (>= emacs-major-version 24)
	(ido-vertical-mode t))


;; big minibuffer height, for ido to show choices vertically
;;(setq max-mini-window-height 0.5)

(provide 'init-ido)
;;; init-ido.el
