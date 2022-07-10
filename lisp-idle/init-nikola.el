

;; nikola use mako as its template engine
;; mmm-mode doesnot fit with use-package, don't know why
(require 'mmm-mode)
(require 'mmm-mako)

(setq mmm-global-mode 'maybe)

(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.tmpl\\'" 'mako)

;; use tab as tab in mmm-mode
(define-key mmm-mode-map
  (kbd "<tab>") '(lambda () (interactive) (insert-char 32 2)))

;(define-key mmm-mode-map
;  (kbd "<tab>") '(lambda () (interactive) (insert-char 9 1)))

(provide 'init-nikola)
;; init-nikola ends here

