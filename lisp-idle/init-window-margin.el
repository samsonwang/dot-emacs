

(defun toggle-window-margin-right (&optional margin-width)
  "Toggle the right margin between `fill-column' or window width.
  This command is convenient when reading novel, documentation."
  (interactive "P")
  (if (null (cdr (window-margins)))
      (cond
       (margin-width
        (set-window-margins nil 0 (- (window-body-width) margin-width))
        (message (format "window margins set to %d" margin-width)))
       (t
        (set-window-margins nil 0 (- (window-body-width) fill-column))
        (message (format "window margins set to %d" fill-column))))
    (progn
      (set-window-margins nil 0 0)
      (message "window margins cancelled"))))

(global-set-key (kbd "C-x 4") #'toggle-window-margin-right)

(setq-default fill-column 90)

;; TODO:
;; 1. update window margins when window change
;; 2. cancel window margins only when margin equals target
;; 3. consider use 90 instead of 'fill-column'

(provide 'init-window-margin)
