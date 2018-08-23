

(require 'cl)

(setq conv-dir "~/.emacs.d/site-lisp/misc/")
(setq conv-file-regexp "\.[el|h|cpp]$")
(setq conv-encoding-dest 'utf-8-unix)

;; "^\\."
(defun convert-file-coding-system (@fpath @coding-system)
  "Convert file's encoding."
  (let ($buffer
        ($buffer-opened-p (get-file-buffer @fpath)))
    (if $buffer-opened-p
        (with-current-buffer $buffer-opened-p
          (set-buffer-file-coding-system @coding-system)
          (save-buffer)
          )
      (progn
        (setq $buffer (find-file @fpath))
        (set-buffer-file-coding-system @coding-system)
        (save-buffer)
        (kill-buffer $buffer)))))

(defun conv-start()
  (interactive)
  (message "convert start!!")
  (loop for file-path in (directory-files conv-dir t)
        when (string-match conv-file-regexp file-path)
        do (message (concat "converting: " file-path))
        (convert-file-coding-system file-path conv-encoding-dest))
  (message "convert finish!!"))

(conv-start)

(provide 'conv-encoding)

