;; -*- coding:utf-8 -*-
;; recentf setting

;; Keep a list of recently opened files
(recentf-mode t)
;; recentf-mode
(setq recentf-save-file (expand-file-name ".recentf" config-home))
(setq recentf-auto-cleanup 300)
(setq recentf-keep '(file-remote-p file-readable-p))
(setq recentf-max-saved-items 10)

;; strip $HOME from the front of recentf files
(add-to-list 'recentf-filename-handlers 'abbreviate-file-name)

(setq recentf-exclude '("/tmp/" "/ssh:" "/sudo:"
                        ;; ctags
                        "/TAGS$"
                        ;; global
                        "/GTAGS$" "/GRAGS$" "/GPATH$"
                        ;; binary
                        "\\.mkv$" "\\.mp[34]$" "\\.avi$" "\\.pdf$"
                        ;; sub-titles
                        "\\.sub$" "\\.srt$" "\\.ass$"
                        "/ido.last$"
                        ;; ~/.emacs.d/**/*.el included
                        ;; "/home/[a-z]\+/\\.[a-df-z]"
                        ;; configuration file should not be excluded
                        ))

(provide 'init-recentf)
;;; init-misc.el ends here

