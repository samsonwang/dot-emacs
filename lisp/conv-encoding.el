

(require 'cl)

(setq conv-dir "~/conv-test")
(setq conv-file-regexp "\.org$")
(setq conv-encoding-dest "utf-8")

;; "^\\."

(defun conv-start()
  (interactive)
  (loop for conv-file-name in (directory-files conv-dir t)
        when (string-match conv-file-regexp conv-file-name)
        do (message (concat "converting: " conv-file-name))
        (find-file conv-file-name)
        (set-buffer-file-coding-system 'gbk)
;;        (save-buffer)
;;        (kill-buffer conv-file-name)
        )
  )

(conv-start)

(provide 'conv-encoding)

