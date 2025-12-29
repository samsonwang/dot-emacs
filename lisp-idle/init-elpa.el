;; -*- coding:utf-8 -*-

;; package to install, in alphabetical order
(defvar my-packages
  '(aggressive-indent
    beacon
    ;; bind-key ;; bind-key is shipped with use-package
    company
    cmake-mode
    diminish
    disable-mouse
    ;; dockerfile-mode
    dracula-theme
    ;; elfeed
    exec-path-from-shell
    flycheck
    go-mode ;; major mode for golang
    helm
    helm-projectile
    helm-gtags
    helm-roam
    ;; helm-smex
    ;; helm-swoop ;; Type a pattern and all the matching lines are shown in another buffer.
    highlight-symbol
    htmlize
    iedit ;; Edit multiple regions in the same way simultaneously.
    ;; logview ;; major mode for log files
    ;; magit
    markdown-mode
    ;; mmm-mako
    org-roam
    projectile
    ;; pyim ;; using a self-tailored version in site-lisp
    ;; posframe ;; introduced in emacs26, required by emacs26
    ;; qt-pro-mode
    ;; smex
    undo-tree
    use-package ;; already installed in site-lisp folder
    wc-mode
    which-key ;; built-in package in emacs 30.1
    yaml-mode
    yasnippet
    yasnippet-snippets
    ;;
    ))

;; use mirror package for a better download speed
(setq package-archives-use-mirror t)

(if 'package-archives-use-mirror
    (setq package-archives
          '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
            ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
            ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")))
  (add-to-list 'package-archives
               '("melpa" . "https://stable.melpa.org/packages/")))

;; (unless *emacs26* )
(setq package-check-signature nil)

(defun install-packages ()
  "Install all packages in `my-packages'."
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (package my-packages)
    (unless (package-installed-p package)
      (package-install package))))

(install-packages)


;; auto install package above

(provide 'init-elpa)
;;; init-customization.el ends here
