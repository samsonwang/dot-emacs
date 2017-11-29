;; -*- coding:utf-8 -*-
;; MELPA configurations are contained
;; Mostly the package basic configurations
;;

;;=============================================================================
;;  Package settings
;;=============================================================================

(when *emacs24*
  
  ;; melpa packages
;;  (add-to-list 'package-archives
;;               '("melpa-stable" .
;;                 "https://stable.melpa.org/packages/"))
  
;;  (add-to-list 'package-archives
;;               '("melpa-cn-stable" .
;;                 "http://elpa.emacs-china.org/melpa-stable/"))
  
  (add-to-list 'package-archives
               '("melpa-stable-163" .
                 "http://mirrors.163.com/elpa/melpa-stable/"))
  
;;  (add-to-list 'package-archives
;;    '("popkit" . "http://elpa.popkit.org/packages/"))
;;  (add-to-list 'package-archives
;;    '("melpa-cn"        . "http://elpa.emacs-china.org/melpa/"))

  
  (require 'elpa-auto-install.el)
  ;; package to install
  (defvar my-packages
    '(company
      yasnippet
      markdown-mode
      helm
      projectile
      treemacs
      helm-projectile
      treemacs-projectile
      
      ))
  
  ;; auto install package above
  (auto-install-packages my-packages)

  ;; package configurations
  
  ;; Enable Global Company Mode
  (global-company-mode t)

  ;; Enable yasnippet
  (require 'yasnippet)
  (setq yas-verbosity 0)
  (setq yas-snippet-dirs (concat config-home "snippets"))
  (yas-global-mode 1)
  (setq yas-verbosity 3)
  

  ;; (require 'init-ivy)

  ;; Enable smex
  ;; (smex-initialize)
  
  ;;(require 'init-global)
  ;;(require 'init-tramp)
  ;;(require 'init-modeline)
  )


(provide 'init-elpa)
;;; init-customization.el ends here

