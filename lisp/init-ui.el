;; -*- coding:utf-8 -*-

;; Enable theme
(when (display-graphic-p)

  (add-to-list 'custom-theme-load-path
               (expand-file-name "site-lisp/theme" user-emacs-directory))

  ;;(load-theme 'autumn-light t)
  (load-theme 'dracula t)

  ;; startup full screen
  (add-to-list 'initial-frame-alist '(fullscreen . maximized))
  ;; (add-to-list 'default-frame-alist '(fullscreen . fullheight))
  )


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

;; show column number in modeline
(setq column-number-mode t)

;; 对于mode line 的详细设置可以查看以下variable
;; mode-line-format
;; mode-line-modes
;; @see http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; But I need global-mode-string,
;; @see http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_360.html


;; Fontset

(when (display-graphic-p)
  (defun get-dpi ()
    (let* ((attrs (car (display-monitor-attributes-list)))
           (size (assoc 'mm-size attrs))
           (sizex (cadr size))
           (res (cdr (assoc 'geometry attrs)))
           (resx (- (caddr res) (car res)))
           dpi)
      (catch 'exit
        ;; in terminal
        (unless sizex
          (throw 'exit 10))
        ;; on big screen
        (when (> sizex 1000)
          (throw 'exit 10))
        ;; DPI
        (* (/ (float resx) sizex) 25.4))))

  (defun get-preferred-font-size ()
    (let ( (dpi (get-dpi)) )
      (cond
       ((< dpi 110) 16)
       ((< dpi 130) 18)
       ((< dpi 160) 24)
       (t 28))))

  (message (concat "dpi:" (number-to-string (get-dpi))
                   " font-size:" (number-to-string (get-preferred-font-size))))

  (setq font-size (get-preferred-font-size))

  (defun set-fontset (english-name chinese-name english-size chinese-size)
    (set-face-attribute 'default nil :font
                        (format  "%s:pixelsize=%d"  english-name english-size))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
                        (font-spec :family chinese-name :size chinese-size))))
  (when *windows*
    (set-fontset "Consolas" "微软雅黑" font-size font-size))
  (when *macintosh*
    (set-fontset "Menlo" "Menlo" font-size font-size))
  (when *linux*
    (set-fontset "Mono" "Noto Sans Mono CJK SC" font-size font-size)))

(provide 'init-ui)
;;; init-theme.el ends here
