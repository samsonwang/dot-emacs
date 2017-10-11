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
  (define-key org-mode-map (kbd "*") (self-insert-command "*"))
  (define-key org-mode-map (kbd "－") (self-insert-command "-")))


;; Enable auto swap line in org mode
(add-hook 'org-mode-hook
          (lambda ()
            (org-mode-fontface-init)
            (org-mode-keyboard-init)
            (setq tab-width 2)
            (setq truncate-lines nil)))

;; Add todo keywords
(setq org-todo-keywords
      '((sequence "TODO" "PENDING" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))

;; syntax highlight in emacs begin_src block
(setq org-src-fontify-natively t)

;; enable shift selecting
(setq org-support-shift-select t)

;; org startup expand all headlines
(setq org-startup-folded 'showeverything)

(provide 'init-org-mode)
;;; init-org-mode.el ends here

