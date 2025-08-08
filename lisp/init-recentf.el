;; -*- coding:utf-8 -*-
;; recentf setting

(use-package recentf
  :init
  ;; Keep a list of recently opened files
  (setq recentf-save-file (expand-file-name "recentf" user-emacs-cache))
  ;;
  ;; strip $HOME from the front of recentf files
  ;;(add-to-list 'recentf-filename-handlers 'abbreviate-file-name)

  ;; :bind
  ;; ("C-c r" . recentf-open-files)
  ;; access to recentf with helm-mini

  :config
  (recentf-mode t)

  :custom
  (recentf-auto-cleanup 3600)
  (recentf-max-saved-items 100)
  (recentf-keep '(file-remote-p file-readable-p))
  (recentf-exclude '("/tmp/" "/ssh:" "/sudo:"
                     ;; ctags
                     "/TAGS$"
                     ;; global
                     "/GTAGS$" "/GRAGS$" "/GPATH$"
                     ;; binary
                     "\\.mkv$" "\\.mp[34]$" "\\.avi$" "\\.pdf$"
                     ;; sub-titles
                     "\\.sub$" "\\.srt$" "\\.ass$"
                     "/ido.last$")))

(idle-require 'recentf)

(provide 'init-recentf)
;;; init-misc.el ends here
