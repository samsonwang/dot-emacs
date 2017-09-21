;; -*- coding: utf-8 -*-
;; Custom Settings


;;===============================================================
;;  Setup default open directory
;;===============================================================
(when *windows* (setq default-directory "~/"))

;;===============================================================
;;  Single line switch
;;===============================================================
;; Autosave desktop when emacs exit
;;(desktop-save-mode t)

;; Hide startup message
(setq inhibit-startup-message t)
;; Show paired parentheses
(show-paren-mode t)
;; Turn off sound alarms completely
;;(setq ring-bell-function 'ignore)
;; Warning signal by flash screen
(setq visible-bell 1)

;; Display system time in modeline
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq system-time-locale "C")  ;; Change time display into English
(display-time)

;; Use y/n for short
(fset 'yes-or-no-p 'y-or-n-p)


;;===============================================================
;;  Line wrap and Line number
;;===============================================================
;; Enable gloabl line wrap
;;(set-default 'truncate-lines t)
(setq truncate-lines nil)

;; enable global line number
(global-linum-mode t)
(setq linum-format "%3d ")
;; show column number in modeline
(setq column-number-mode t)
;; Blacklist for display line numbers
(setq linum-disabled-modes-list
      '(eshell-mode message-mode))


;;===============================================================
;;  Fancy display for diary and calendar
;;===============================================================
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)


;;===============================================================
;;   Emacs title bar to reflect file name
;;===============================================================
(defun frame-title-string ()
  "Return the file name of current buffer, using ~ if under home directory"
  (let ((fname
		 (or (buffer-file-name (current-buffer))
			 (buffer-name)) ))
	;;let body
	(when (string-match (getenv "HOME") fname)
	  (setq fname (replace-match "~/" t t fname)))
	fname))
;; Title = 'system-name @ foo.bar'
(setq frame-title-format '( (:eval (frame-title-string))
			    " - Emacs @ "system-name" " ) )


;;===============================================================
;;  Default stracth buffer
;;===============================================================
(defun show-scratch-buffer-message ()
  (if (executable-find "fortune")
      (format
       ";; %s\n\n"
       (replace-regexp-in-string
        "\n" "\n;; " ; comment each line
        (replace-regexp-in-string
         ; remove trailing linebreak
         "\\(\n$\\|\\|\\[m *\\|\\[[0-9][0-9]m *\\)" ""
         (shell-command-to-string "fortune"))))
    (concat ";; Happy hacking "
            (or user-login-name "")
            " - Emacs loves you!\n\n")))
(setq-default initial-scratch-message (show-scratch-buffer-message))



(provide 'init-misc)
;;; init-misc.el ends here

