
(define-derived-mode log-mode nil "Log"
  "A major mode for viewing log files"
  (read-only-mode)
  (font-lock-mode 0))

;;;###autoload
(progn
  ;; (add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . log-mode))
  (add-to-list 'auto-mode-alist '("\\.log\\'" . log-mode)))

(provide 'log-mode)
