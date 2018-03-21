;; -*- coding:utf-8 -*-


;; Turn off sound alarms completely
;;(setq ring-bell-function 'ignore)
;; Warning signal by flash screen
(setq visible-bell 1)

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


(defun mode-line-bell-flash ()
  "Flash the mode line momentarily"
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))

(setq-default ring-bell-function 'mode-line-bell-flash)


(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (emacs-lisp-mode)
    ))

;; misc delay is returned
(provide 'init-misc-delay)

