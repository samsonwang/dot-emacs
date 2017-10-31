;; -*- coding:utf-8 -*-
;; recentf setting

(use-package recentf
  :init
  ;; Keep a list of recently opened files
  
  (setq recentf-save-file (expand-file-name ".recentf" config-home))
  (setq recentf-auto-cleanup 'never)
  (setq recentf-keep '(file-remote-p file-readable-p))
  (setq recentf-max-saved-items 10)
  
  ;; strip $HOME from the front of recentf files
  ;;(add-to-list 'recentf-filename-handlers 'abbreviate-file-name)
  
  (setq recentf-exclude '("/tmp/" "/ssh:" "/sudo:"
                          ;; ctags
                          "/TAGS$"
                          ;; global
                          "/GTAGS$" "/GRAGS$" "/GPATH$"
                          ;; binary
                          "\\.mkv$" "\\.mp[34]$" "\\.avi$" "\\.pdf$"
                          ;; sub-titles
                          "\\.sub$" "\\.srt$" "\\.ass$"
                          "/ido.last$"))
  
  :bind
  ("C-c r" . recentf-open-files)
  :config
  (recentf-mode t))


(provide 'init-recentf)
;;; init-misc.el ends here

