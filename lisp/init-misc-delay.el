;; -*- coding:utf-8 -*-


;; Show paired parentheses
(show-paren-mode t)


;; Use y/n for short
(fset 'yes-or-no-p 'y-or-n-p)


;; Display system time in modeline
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq system-time-locale "C")  ;; Change time display into English
(display-time)


;;  Fancy display for diary and calendar
(setq view-diary-entries-initially t
      mark-diary-entries-in-calendar t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)


;; misc delay is returned
(provide 'init-misc-delay)

