
;; always use space instead of tab
(setq-default indent-tabs-mode nil)

;; use indent as complete
(setq-default tab-always-indent 'complete)

;; default tab width
(setq-default tab-width 4)

;; Force charset page to utf-8
;;(set-language-environment "utf-8")
;;(set-locale-environment "utf-8")
(setq-default buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'gbk)
(prefer-coding-system 'utf-8-unix)

;; aggressive indent
(use-package aggressive-indent
  :diminish aggressive-indent-mode)

;; nice scrolling
(setq scroll-margin 3
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Enable gloabl line wrap
(setq truncate-lines nil)

(provide 'init-editor)
