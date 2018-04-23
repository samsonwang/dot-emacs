

(use-package dired
  :bind
  (:map
   dired-mode-map
   ;; Q is bind to "dired-do-find-regex-and-replace"
   ;; windows do not have grep by default, 
   ("Q" . dired-do-query-replace-regexp)
   )
  )

(provide 'init-dired)
;; init-dired ends here

;; no-byte-compile: t
;; End:

