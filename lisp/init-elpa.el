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
      helm-gtags
      magit
      smex
      helm-smex
      htmlize
      undo-tree
      flycheck
      exec-path-from-shell
      ))
  
  ;; auto install package above
  (auto-install-packages my-packages))


(provide 'init-elpa)
;;; init-customization.el ends here

