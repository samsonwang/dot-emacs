;; -*- coding: utf-8 -*-

;; always use space instead of tab
(setq-default indent-tabs-mode nil)

;; use indent as complete
(setq-default tab-always-indent 'complete)

;; default tab width
(setq-default tab-width 4)

(add-hook 'python-mode-hook
          (lambda ()
            (setq indent-tabs-mode t)
            (setq tab-width 4)))

; (global-set-key (kbd "<tab>") '(lambda () (interactive) (insert-char 9 1)))
; (global-set-key (kbd "TAB") 'self-insert-command)

;; use utabify to convert tabs to spaces
(use-package untabify
  :commands untabify
  :bind ("C-x <tab>" . untabify))

;;(global-set-key (kbd "C-x <tab>") 'untabify)

;; show spaces in c mode, c++ mode, lisp-mode
;;(require 'whitespace)
;;(global-whitespace-mode t)
;;(setq whitespace-global-modes '(c-mode c++-mode emacs-lisp-mode))

(provide 'init-tabs)
;; init-tabs ends here

