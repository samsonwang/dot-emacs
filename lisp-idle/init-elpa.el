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
    dockerfile-mode
    dracula-theme
    ;; elfeed
    exec-path-from-shell
    flycheck
    go-mode ;; major mode for golang
    helm
    helm-projectile
    helm-gtags
    helm-smex
    ;; helm-swoop ;; Type a pattern and all the matching lines are shown in another buffer.
    highlight-symbol
    htmlize
    iedit ;; Edit multiple regions in the same way simultaneously.
    ;; logview ;; major mode for log files
    magit
    markdown-mode
    ;; mmm-mako
    projectile
    ;; pyim ;; using a self-tailored version in site-lisp
    ;; posframe ;; introduced in emacs26, required by emacs26
    qt-pro-mode
    smex
    undo-tree
    use-package ;; already installed in site-lisp folder
    wc-mode
    which-key
    yasnippet
    yasnippet-snippets
    yaml-mode
    ;;
    ))

(setq package-archives-use-mirror t)

(if 'package-archives-use-mirror
    (setq package-archives
          '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
            ("nongnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
            ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/stable-melpa/")))
  (add-to-list 'package-archives
               '("melpa" . "https://stable.melpa.org/packages/")))

;; (unless *emacs26* )
(setq package-check-signature nil)

(require 'cl-lib)
(defun package-install-ex (my-packages)
  "Ensure the packages I need are installed. See `my-packages'."
  (let ((missing-packages
         (cl-remove-if #'package-installed-p my-packages)))
    (when missing-packages
      (message "Installing %d missing package(s)" (length missing-packages))
      (package-refresh-contents)
      ;; (mapc #'package-install missing-packages)
      (mapc (lambda (package-name)
              (message "Installing package: %s" package-name)
              (package-install package-name))
            missing-packages))))

;; auto install package above
(package-install-ex my-packages)

(provide 'init-elpa)
;;; init-customization.el ends here
