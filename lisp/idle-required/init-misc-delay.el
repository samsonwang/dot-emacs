;; -*- coding:utf-8 -*-

;; ask before quit
(setq confirm-kill-emacs 'y-or-n-p)

;; Show paired parentheses
(show-paren-mode t)

;; insert parentheses in pairs
(electric-pair-mode t)
(setq electric-pair-preserve-balance nil)

;; Use y/n for short
(fset 'yes-or-no-p 'y-or-n-p)

;; Display system time in modeline
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq system-time-locale "C")  ;; Change time display into English
                                        ;(display-time)


;;  Fancy display for diary and calendar
(setq calendar-view-diary-initially-flag t
      calendar-mark-diary-entries-flag t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; Warning signal by flash modeline
(defun mode-line-bell-flash ()
  "Flash the mode line momentarily"
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))
(setq-default ring-bell-function 'mode-line-bell-flash)

;; delete trailling space before save
;;(add-hook 'before-save-hook #'whitespace-cleanup)
(add-hook 'before-save-hook #'delete-trailing-whitespace)

(defun create-scratch-buffer ()
  "create a new scratch buffer to work in.
   (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname
                   (concat "*scratch"
                           (if (= n 0) "" (int-to-string n))
                           "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (lisp-interaction-mode)
    ))

(defun byte-compile-init-dir ()
  "Byte-compile all your lisp files."
  (interactive)
  (byte-recompile-directory user-emacs-directory 0))

;; site lisp directory for load path
(defun init-site-lisp-load-path ()
  (eval-when-compile (require 'cl))
  (if (fboundp 'normal-top-level-add-to-load-path)
      (let* ((site-lisp-dir "~/.emacs.d/site-lisp/")
             (default-directory site-lisp-dir))
        (progn
          (setq load-path
                (append
                 (loop for dir in (directory-files site-lisp-dir)
                       unless (string-match "^\\." dir)
                       collecting (expand-file-name dir))
                 load-path))))))

(defun disable-auto-indent()
  "disable auto indent for this buffer temporary"
  (interactive)
  (electric-indent-local-mode -1)
  (aggressive-indent-mode -1)
  (message "auto-indent disabled"))

;; misc delay is returned
(provide 'init-misc-delay)
