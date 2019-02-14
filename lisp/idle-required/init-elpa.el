;; -*- coding:utf-8 -*-

;; package to install
(defvar my-packages
  '(aggressive-indent
    beacon
    company
    diminish
    exec-path-from-shell
    flycheck
    helm
    helm-projectile
    helm-gtags
    helm-smex
    helm-swoop
    highlight-symbol
    htmlize
    iedit
    magit
    markdown-mode
    projectile
    qt-pro-mode
    smex
    undo-tree
    which-key
    yasnippet))
;; mmm-mako

;; use melpa mirror
(if *windows*
    (setq package-archives
          '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
            ("melpa" . "http://elpa.emacs-china.org/melpa-stable/")))
  (setq package-archives
        '(("gnu"   . "https://elpa.emacs-china.org/gnu/")
          ("melpa" . "https://elpa.emacs-china.org/melpa-stable/"))))

;; (add-to-list 'package-archives
;;              '("melpa-stable" .
;;                "https://stable.melpa.org/packages/"))

;; (setq package-archives
;;       '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;         ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/")))

;; (add-to-list 'package-archives
;;              '("melpa-stable" .
;;                "http://mirrors.163.com/elpa/melpa-stable/"))


(require 'cl-lib)
(defun package-install-ex (my-packages)
  "Ensure the packages I need are installed. See `my-packages'."
  (let ((missing-packages
         (cl-remove-if #'package-installed-p my-packages)))
    (when missing-packages
      (message "Installing %d missing package(s)" (length missing-packages))
      (package-refresh-contents)
      (mapc #'package-install missing-packages))))

;; auto install package above
(package-install-ex my-packages)

(provide 'init-elpa)
;;; init-customization.el ends here
