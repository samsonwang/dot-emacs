
(use-package dired
  :bind
  (:map
   dired-mode-map
   ;; Q is bind to "dired-do-find-regex-and-replace"
   ;; windows do not have grep by default,
   ("Q" . dired-do-query-replace-regexp)))

;; helm-comp-read == completing-read
(defun dired-sort (criteria)
  "sort-dired by different criteria by Robert Gloeckner"
  (interactive
   (list
    (or (helm-comp-read "sort-by: "
                        '("size(S)" "extension(X)" "creation-time(ct)"
                          "access-time(ut)" "time(t)" "name()"))
        "")))
  (string-match ".*(\\(.*\\))" criteria)
  (dired-sort-other
   (concat dired-listing-switches
           (match-string 1 criteria))))

(provide 'init-dired)
;; init-dired ends here

;; no-byte-compile: t
;; End:
