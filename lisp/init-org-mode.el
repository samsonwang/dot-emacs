;; -*- coding:utf-8 -*-
;; Customize org-mode

(require 'org)

;; Init org-mode fontface
(defun org-mode-fontface-init ()
  (set-face-attribute 'org-level-1 nil :height 1.2 :bold t)
  (set-face-attribute 'org-level-2 nil :height 1.1 :bold t)
  (set-face-attribute 'org-level-3 nil :height 1.1))


;; Init org-mode keybindings
(defun org-mode-keyboard-init ()
  (define-key org-mode-map (kbd "*") (kbd "*"))
  (define-key org-mode-map (kbd "－") (kbd "-")))


;; Enable auto swap line in org mode
(add-hook 'org-mode-hook
          (lambda () (setq truncate-lines nil))
          (org-mode-fontface-init))

;; Add todo keywords 
(setq org-todo-keywords
      '((sequence "TODO" "PENDING" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))

;; syntax highlight in emacs begin_src block
(setq org-src-fontify-natively t)

;; enable shift selecting
(setq org-support-shift-select t)

;; org startup expand all headlines
(setq org-startup-folded (quote showeverything))
					 
(provide 'init-org-mode)
;;; init-org-mode.el ends here


