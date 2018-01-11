

;; nikola use mako as its template engine
(use-package mmm-mako
  :init
  (require 'mmm-auto)
  
  (setq mmm-global-mode 'maybe)
  (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . html-mode))
  (mmm-add-mode-ext-class 'html-mode "\\.tmpl\\'" 'mako)
)

(provide 'init-nikola)
;; init-nikola ends here

