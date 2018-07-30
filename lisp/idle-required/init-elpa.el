;; -*- coding:utf-8 -*-

;; package to install
(defvar my-packages
  '(diminish
    company
    yasnippet
    markdown-mode
    helm
    helm-projectile
    helm-gtags
    helm-smex
    helm-swoop
    projectile
    ;;    treemacs
    ;;    treemacs-projectile
    magit
    smex
    htmlize
    undo-tree
    flycheck
    exec-path-from-shell
    iedit
    mmm-mako
    highlight-symbol
    aggressive-indent
    ;;  auto-indent-mode
    ))

;; melpa packages
  (add-to-list 'package-archives
               '("melpa-stable" .
                 "https://stable.melpa.org/packages/"))

;;  (add-to-list 'package-archives
;;               '("melpa-cn-stable" .
;;                 "http://elpa.emacs-china.org/melpa-stable/"))

;;  (add-to-list 'package-archives
;;    '("melpa-cn"        . "http://elpa.emacs-china.org/melpa/"))

;;(add-to-list 'package-archives
;;             '("melpa-stable" .
;;               "http://mirrors.163.com/elpa/melpa-stable/"))


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
(sw/install-packages my-packages)

(provide 'init-elpa)
;;; init-customization.el ends here

