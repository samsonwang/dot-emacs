

(defun toggle-window-margin-right (&optional margin-width)
  "Toggle the right margin between `fill-column' or window width.
  This command is convenient when reading novel, documentation."
  (interactive "P")
  (if (null (cdr (window-margins)))
      (cond
       (margin-width
        (set-window-margins nil 0 (- (window-body-width) margin-width)))
       (t
        (set-window-margins nil 0 (- (window-body-width) fill-column))))
    (set-window-margins nil 0 0)))

(global-set-key (kbd "C-x 4") #'toggle-window-margin-right)

(setq fill-column 90)

(provide 'init-window-margin)

