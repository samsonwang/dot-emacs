;; -*- coding:utf-8 -*-

;; Enable theme
;; (add-to-list 'custom-theme-load-path
;; (expand-file-name "site-lisp/theme" user-emacs-directory))
;; (load-theme 'autumn-light t)
(use-package dracula-theme
  :if (or (display-graphic-p)
          (daemonp))
  :config
  (load-theme 'dracula t))

;; default font size
(setq current-font-size 24)

(defun set-font-size (font-size)
  (interactive
   (list (string-to-number
          (read-string "Font size: " (number-to-string current-font-size)))))

  (message "font size: %s -> %s" current-font-size font-size)

  (setq current-font-size font-size)

  (defun set-fontset (english-name chinese-name english-size chinese-size)
    (set-face-attribute 'default nil :font
                        (format "%s:pixelsize=%d" english-name english-size))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font)
                        charset
                        (font-spec :family chinese-name :size chinese-size))))
  (when *windows*
    (cond
     ;; chectk whether font is installed
     ((member "Source Code Pro" (font-family-list))
      (set-fontset "Source Code Pro" "Microsoft YaHei" font-size font-size))
     ((member "SauceCodePro Nerd Font Mono" (font-family-list))
      (set-fontset "SauceCodePro Nerd Font Mono" "Microsoft YaHei" font-size font-size))
     (t
      (set-fontset "Consolas" "Microsoft YaHei" font-size font-size))))

  (when *macintosh*
    (set-fontset "Menlo" "Menlo" font-size font-size))

  (when *linux*
    (set-fontset "Mono" "Noto Sans Mono CJK SC" font-size font-size))

  ;; specify font for all unicode characters
  ;; http://xahlee.info/comp/unicode_font_download.html
  (when (member "Symbola" (font-family-list))
    (set-fontset-font t 'unicode "Symbola" nil 'prepend))

  ;; invoke customize face and save
  ;; (if (interactive-p)
  ;;   (customize-face 'default))
  )

(cond
 ((display-graphic-p)
  ;; graphical user interface
  ;; startup full screen
  (add-to-list 'initial-frame-alist '(fullscreen . maximized))
  ;; (add-to-list 'default-frame-alist '(fullscreen . fullheight))
  (add-to-list 'default-frame-alist '(height . 32))

  ;; fontset
  (defconst screen-dpi
    (let* ((attrs (car (display-monitor-attributes-list)))
           (size (assoc 'mm-size attrs))
           (sizex (cadr size))
           (res (cdr (assoc 'geometry attrs)))
           (resx (- (cl-caddr res) (car res)))
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

  (setq current-font-size
        (let ((dpi screen-dpi))
          (cond
           ((< dpi 100) 20)
           ((< dpi 110) 22)
           ((< dpi 120) 24)
           ((< dpi 140) 27)
           ((< dpi 170) 28)
           (t 32))))
  ;; dell workstation: dpi=96 font=20
  ;; dell xps13: dpi=165.877 font=28
  ;; dell xps13 + aoc: dpi=101.940 font=26

  (message (concat "dpi: " (number-to-string screen-dpi)
                   " font-size: " (number-to-string current-font-size)))
  (set-font-size current-font-size))

 ((daemonp)
  (add-to-list 'initial-frame-alist '(fullscreen . maximized))
  (add-to-list 'default-frame-alist '(fullscreen . maximized))

  (defun daemon-set-font-size(frame)
    (select-frame frame)
    (set-font-size current-font-size)
    (remove-hook 'after-make-frame-functions
                 'daemon-set-font-size))
  (add-hook 'after-make-frame-functions
            'daemon-set-font-size))

 (t
  ;;"non graphical user interface"
  ;; hide menubar
  (menu-bar-mode 0)))

;; hide toolbar and scrollbar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode 0))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode 0))
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode 0))

;; Hide startup message
(setq inhibit-startup-message t)
;; Default stracth buffer
(defun scratch-buffer-message ()
  (if (executable-find "fortune")
      (format ";; %s\n\n"
              (replace-regexp-in-string
               "\n" "\n;; " ;; comment each line
               (replace-regexp-in-string
                ;; remove trailing linebreak
                "\\(\n$\\|\\|\\[m *\\|\\[[0-9][0-9]m *\\)" ""
                (shell-command-to-string "fortune"))))
    (concat ";; Happy hacking "
            (or user-login-name "")
            " - Emacs loves you!\n\n")))
(setq-default initial-scratch-message (scratch-buffer-message))

;; frame title = 'foo.bar @ system-name - Emacs '
(setq-default frame-title-format
              '(" " (:eval (if (buffer-file-name)
                               (abbreviate-file-name (buffer-file-name))
                             (buffer-name)))
                " @ " system-name " - Emacs"))

;; 对于mode line 的详细设置可以查看以下variable
;; mode-line-format
;; mode-line-modes
;; @see http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; But I need global-mode-string,
;; @see http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_360.html

(provide 'init-ui)
;;; init-theme.el ends here
