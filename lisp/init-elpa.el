;; -*- coding:utf-8 -*-
;; MELPA configurations are contained
;; Mostly the package basic configurations
;;

;;=============================================================================
;;  Package settings
;;=============================================================================
;; Enable smex
(smex-initialize)

;; Enable Global Company Mode
(global-company-mode t)

;; Enable yasnippet
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs (concat config-home "snippets"))

;; Enable autocomplete mode
;;(auto-complete-mode t)
;;(ac-config-default)	;; auto-complete basic configuration

(provide 'init-elpa)
;;; init-customization.el ends here

