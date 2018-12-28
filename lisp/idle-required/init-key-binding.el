;; -*- coding:utf-8 -*-
;; Keybindings

;; eval buffer
(global-set-key [f5] #'eval-buffer)

;; unset C-x m for mail, because it is easily mixed with C-x C-m
;;(global-unset-key (kbd "C-x m"))

;; set-mark-command is usually mixed with input
(global-set-key (kbd "C-c m") #'set-mark-command)
(global-set-key (kbd "C-c M-m") #'set-mark-command)


;; Unset C-z for suspend-frame
(global-unset-key (kbd "C-z"))
;;(global-set-key (kbd "C-z") 'suspend-frame-ex)
(global-set-key (kbd "C-c C-z") #'suspend-frame-ex)
(defun suspend-frame-ex ()
  (interactive)
  (if (display-graphic-p)
	(message "Suspend-frame kbd disabled for graphical displays.")
	(suspend-frame)))


(global-set-key (kbd "C-c r") #'revert-buffer-no-confirm)
(global-set-key (kbd "C-c M-r") #'revert-buffer-no-confirm)
;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm)
  (message "buffer reverted"))


(provide 'init-key-binding)
;;; init-key-binding.el ends here
