;; -*- coding:utf-8 -*-
;; Customize org-mode

(use-package org
  :mode
  ("\\.org\\'" . org-mode)

  :interpreter
  ("org" . org-mode)

  ;; I wonder why this failed to diminish org-indent-mode
  :diminish org-indent-mode

  :init
  (defun org-mode-hook-func ()
    (setq tab-width 2)
    (setq truncate-lines nil)
    (linum-mode))

  (add-hook 'org-mode-hook 'org-mode-hook-func)

  :config
  ;; Add todo keywords
  (setq org-todo-keywords
        '((sequence "TODO" "PENDING" "FEEDBACK" "VERIFY" "|"
                    "DONE" "DELEGATED")))

  ;; syntax highlight in emacs begin_src block
  (setq org-src-fontify-natively t)

  ;; @https://emacs.stackexchange.com/questions/13820/inline-verbatim-and-code-with-quotes-in-org-mode
  (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n,")
  (org-set-emph-re 'org-emphasis-regexp-components
                   org-emphasis-regexp-components)

  ;; enable shift selecting
  (setq org-support-shift-select t)

  ;; org startup expand all headlines
  (setq org-startup-folded 'content)

  (set-face-attribute 'org-level-1 nil :height 1.2 :bold t)
  (set-face-attribute 'org-level-2 nil :height 1.1 :bold t)
  (set-face-attribute 'org-level-3 nil :height 1.1))

(provide 'init-org-mode)
;;; init-org-mode.el ends here

