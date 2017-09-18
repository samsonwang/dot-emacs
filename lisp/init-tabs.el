;; -*- coding: utf-8 -*-

(setq-default indent-tabs-mode nil)
(setq tab-always-indent 'complete)
(setq-default tab-width 4)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

(setq c-tab-always-indent t)

(add-hook 'python-mode-hook
          (lambda ()
           (setq indent-tabs-mode t)
           (setq tab-width 4)))

(add-hook 'emacs-lisp
          (lambda ()
            (setq indent-tab-mode t)
            (setq c-basic-offset 4)
            (setq tab-width 4)))

; (global-set-key (kbd "<tab>") '(lambda () (interactive) (insert-char 9 1)))
; (global-set-key (kbd "TAB") 'self-insert-command)

;; use utabify to convert tabs to spacesk
(global-set-key (kbd "C-x C-<tab>") 'untabify)

;; show spaces in c mode, c++ mode, lisp-mode
(require 'whitespace)
(global-whitespace-mode t)
(setq whitespace-global-modes '(c-mode c++-mode emacs-lisp-mode))

(provide 'init-tabs)
;; init-tabs ends here
