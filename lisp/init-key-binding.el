
;; -*- coding:utf-8 -*-
;; Keybindings


;; use ibuffer instead of list-buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; eval buffer
(global-set-key [f10] 'eval-buffer)

;; Set C-x C-g to goto line
(global-set-key (kbd "C-x C-g") 'goto-line)

;; unset C-x m for mail, because it is easily mixed with C-x C-m
(global-unset-key (kbd "C-x m"))

;; Unset C-z for suspend-frame
(global-unset-key (kbd "C-z"))
;;(global-set-key (kbd "C-z") 'suspend-frame-ex)
(global-set-key (kbd "C-x C-z") 'suspend-frame-ex)
(defun suspend-frame-ex()
  (interactive)
  (if (display-graphic-p)
	(message "Suspend-frame kbd disabled for graphical displays.")
	(suspend-frame)))

(provide 'init-key-binding)
;;; init-key-binding.el ends here

