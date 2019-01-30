;; -*- coding:utf-8 -*-

;; Enable theme
(when (display-graphic-p)

  (add-to-list 'custom-theme-load-path
               (expand-file-name "site-lisp/theme" user-emacs-directory))

  ;;(load-theme 'autumn-light t)
  (load-theme 'dracula t))

  ;; Set initial window size
;;  (setq initial-frame-alist
;;		(append '((width . 90) (height . 35)
;;        (left . 490) (top . 5))
;;        initial-frame-alist))

  ;; Set default subsequent window size
;;  (setq default-frame-alist
;;		(append '((width . 85) (height . 30)) default-frame-alist)))

;; hide toolbar and scrollbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode 0))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode 0))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode 0))

;; hide menubar in commandline
(unless (display-graphic-p)
  (menu-bar-mode 0))

;; nice scrolling
(setq scroll-margin 3
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; line number
;; (global-linum-mode t)
(if (display-graphic-p)
    (setq linum-format "%3d")
  (setq linum-format "%3d "))

;; Hide startup message
(setq inhibit-startup-message t)
;; Default stracth buffer
(defun scratch-buffer-message ()
  (if (executable-find "fortune")
      (format ";; %s\n\n"
              (replace-regexp-in-string "\n" "\n;; " ; comment each line
                                        (replace-regexp-in-string
                                        ; remove trailing linebreak
                                         "\\(\n$\\|\\|\\[m *\\|\\[[0-9][0-9]m *\\)" ""
                                         (shell-command-to-string "fortune"))))
    (concat ";; Happy hacking "
            (or user-login-name "")
            " - Emacs loves you!\n\n")))
(setq-default initial-scratch-message (scratch-buffer-message))

;; Enable gloabl line wrap
(setq truncate-lines nil)

;; frame title = 'foo.bar @ system-name'
(setq frame-title-format
      '(" "
        (:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 (buffer-name)))
			  " - Emacs @ " system-name))

;; modeline setting
(setq-default mode-line-buffer-identification
              (list
               ;; put projectile in the first
               '(:eval (if (fboundp 'projectile-project-name)
                           (format "[%s] " (projectile-project-name))))
               (propertized-buffer-identification "%12b")))

;; show column number in modeline
(setq column-number-mode t)

;; 对于mode line 的详细设置可以查看以下variable
;; mode-line-format
;; mode-line-modes
;; @see http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; But I need global-mode-string,
;; @see http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_360.html


;; Fontset
(defun set-fontset (english-name chinese-name english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format  "%s:pixelsize=%d"  english-name english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese-name :size chinese-size))))

(when (display-graphic-p)
  (when *windows*
    (set-fontset "Consolas" "微软雅黑" 16 16))
  (when *macintosh*
    (set-fontset "Menlo" "Menlo" 16 16))
  (when *linux*
    (set-fontset "Mono" "Noto Sans Mono CJK SC" 16 16)))

(provide 'init-ui)
;;; init-theme.el ends here
