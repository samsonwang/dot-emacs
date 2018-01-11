;; -*- coding:utf-8 -*-
;; MELPA configurations are contained
;; Mostly the package basic configurations
;;

;;=============================================================================
;;  Package settings
;;=============================================================================

(when *emacs24*  
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
      iedit
      diminish ;; use-package need this
      mmm-mako
      ))
  
  ;; melpa packages
;;  (add-to-list 'package-archives
;;               '("melpa-stable" .
;;                 "https://stable.melpa.org/packages/"))
  
;;  (add-to-list 'package-archives
;;               '("melpa-cn-stable" .
;;                 "http://elpa.emacs-china.org/melpa-stable/"))

;;  (add-to-list 'package-archives
;;    '("melpa-cn"        . "http://elpa.emacs-china.org/melpa/"))
  
  (add-to-list 'package-archives
               '("melpa-stable" .
                 "http://mirrors.163.com/elpa/melpa-stable/"))


  (require 'cl-lib)
  (defun sw/install-packages (my-packages)
    "Ensure the packages I use are installed. See `my-packages'."
    (let ((missing-packages
           (cl-remove-if #'package-installed-p my-packages)))
      (when missing-packages
        (message "Installing %d missing package(s)" (length missing-packages))
        (package-refresh-contents)
        (mapc #'package-install missing-packages))))

  ;; auto install package above
  (sw/install-packages my-packages))

(provide 'init-elpa)
;;; init-customization.el ends here

