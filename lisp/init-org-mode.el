;; -*- coding:utf-8 -*-
;; Customize org-mode

(use-package org
  :mode         ("\\.org\\'" . org-mode)
  :interpreter  ("org" . org-mode)
  :init         (add-hook 'org-mode-hook 'org-mode-hook-func)
  :config
  
  ;; Add todo keywords
  (setq org-todo-keywords
        '((sequence "TODO" "PENDING" "FEEDBACK" "VERIFY" "|" "DONE" "DELEGATED")))

  ;; syntax highlight in emacs begin_src block
  (setq org-src-fontify-natively t)

  ;; enable shift selecting
  (setq org-support-shift-select t)

  ;; org startup expand all headlines
  (setq org-startup-folded 'showeverything)
  
  )

(defun org-mode-hook-func ()
  (set-face-attribute 'org-level-1 nil :height 1.2 :bold t)
  (set-face-attribute 'org-level-2 nil :height 1.1 :bold t)
  (set-face-attribute 'org-level-3 nil :height 1.1)
  (setq tab-width 2)
  (setq truncate-lines nil))

(provide 'init-org-mode)
;;; init-org-mode.el ends here

