;; -*- coding:utf-8 -*-
;; Keybindings

;; eval buffer
(global-set-key [f5] #'eval-buffer)

;; unset C-x m for mail, because it is easily mixed with C-x C-m
;;(global-unset-key (kbd "C-x m"))

;; set-mark-command is usually mixed with input
(global-set-key (kbd "C-c m") #'set-mark-command)
;; (global-set-key (kbd "C-c M-m") #'set-mark-command)


;; Unset C-z for suspend-frame
;;(global-unset-key (kbd "C-z"))
;;(global-set-key (kbd "C-z") 'suspend-frame-ex)
(global-set-key (kbd "C-x C-z") #'suspend-frame-ex)
(defun suspend-frame-ex ()
  (interactive)
  (if (display-graphic-p)
      (message "Suspend-frame kbd disabled for graphical displays.")
    (suspend-frame)))


(global-set-key (kbd "C-c r") #'revert-buffer)
(global-set-key (kbd "C-c M-r") #'revert-buffer-no-confirm)
;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm)
  (message "buffer reverted"))


(global-set-key (kbd "C-c d") #'delete-this-file)
;; Delete the current file
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name) t)
    (kill-this-buffer)))


(global-set-key (kbd "C-c n") #'rename-this-file-and-buffer)
;; Rename the current file
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive
   (let ((filename (buffer-file-name)))
     (unless filename
       (error "Buffer '%s' is not visiting a file!" (buffer-name)))
     (list (read-string "New name: " (file-name-nondirectory filename)))))
  ;;(message (format "Rename file to %s" new-name))
  (rename-file (buffer-file-name) new-name)
  (set-visited-file-name new-name)
  (rename-buffer new-name))


(provide 'init-key-binding)
;;; init-key-binding.el ends here
