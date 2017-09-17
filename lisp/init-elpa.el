;; -*- coding:utf-8 -*-
;; MELPA configurations are contained
;; Mostly the package basic configurations
;;

;;=============================================================================
;;  Package settings
;;=============================================================================

(when (>= emacs-major-version 24)
  (require 'elpa-auto-install.el)
  
  ;; package to install
  (defvar my-packages
    '(smex company ido-vertical-mode yasnippet
	  ivy counsel markdown-mode cl-lib))
  
  ;; auto install package above
  (auto-install-packages my-packages)
  
  ;; Enable smex
  (smex-initialize)

  ;; Enable Global Company Mode
  (global-company-mode t)

  ;; Enable yasnippet
  (require 'yasnippet)
  (yas-global-mode 1)
  (setq yas-snippet-dirs (concat config-home "snippets"))
  
  ;; 
  (require 'init-ivy)

  ;;(require 'init-helm)

  
  ;;(require 'init-global)
  ;;(require 'init-tramp)
  ;;(require 'init-modeline)

  )

;; Enable autocomplete mode
;;(auto-complete-mode t)
;;(ac-config-default)	;; auto-complete basic configuration

(provide 'init-elpa)
;;; init-customization.el ends here

