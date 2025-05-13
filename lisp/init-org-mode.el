;; -*- coding:utf-8 -*-
;; Customize org-mode

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :interpreter ("org" . org-mode)
  ;; I wonder why this failed to diminish org-indent-mode
  :diminish org-indent-mode
  :bind
  (("C-c 0"     . org-capture)
   ("C-c 9"     . org-agenda)
   ("C-c 。"    . org-time-stamp))

  :init
  (defun org-mode-hook-func ()
    ;; emacs30.1 requires tab-width set to 8
    ;; (setq tab-width 2)
    (setq truncate-lines nil)
    (display-margin-line-number))

  (add-hook 'org-mode-hook 'org-mode-hook-func)

  :config
  ;; @https://emacs.stackexchange.com/questions/13820/inline-verbatim-and-code-with-quotes-in-org-mode
  (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n")
  (org-set-emph-re 'org-emphasis-regexp-components
                   org-emphasis-regexp-components)

  (set-face-attribute 'org-document-title nil :height 1.1)
  ;; (set-face-attribute 'org-level-1 nil :height 1 :bold t)
  ;; (set-face-attribute 'org-level-2 nil :height 1)
  ;; (set-face-attribute 'org-level-3 nil :height 1)

  :custom
  (org-agenda-files '("~/.agenda/"))
  (org-default-notes-file "~/.agenda/notes.org")
  (org-adapt-indentation nil) ; do not indent
  (org-startup-folded 'content) ; org startup expand all headlines
  (org-support-shift-select t) ; enable shift selecting
  (org-src-fontify-natively t) ; syntax highlight in emacs begin_src block
  (org-edit-src-content-indentation 0)
  (org-todo-keywords '((sequence "TODO" "PENDING" "FEEDBACK" "|"
                                 "DONE" "CANCELED"))) ; Add todo keywords
  )

(provide 'init-org-mode)
;;; init-org-mode.el ends here
