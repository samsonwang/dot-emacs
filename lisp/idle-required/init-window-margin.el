

(defun toggle-window-margin-right ()
  "Toggle the right margin between `fill-column' or window width.
  This command is convenient when reading novel, documentation."
  (interactive)
  (if (null (cdr (window-margins)))
      (set-window-margins nil 0 (- (window-body-width) fill-column))
    (set-window-margins nil 0 0)))

(provide 'init-window-margin)

