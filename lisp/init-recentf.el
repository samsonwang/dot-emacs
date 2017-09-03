;; -*- coding:utf-8 -*-
;; Misc Settings


;;================================================================
;; recentf-mode settings
;;================================================================
;; Keep a list of recently opened files
(recentf-mode t)
;; recentf-mode
(setq recentf-keep '(file-remote-p file-readable-p))
(setq recentf-max-saved-items 10
      recentf-exclude '("/tmp/"
                        "/ssh:"
                        "/sudo:"
                        ;; ctags
                        "/TAGS$"
                        ;; global
                        "/GTAGS$"
                        "/GRAGS$"
                        "/GPATH$"
                        ;; binary
                        "\\.mkv$"
                        "\\.mp[34]$"
                        "\\.avi$"
                        "\\.pdf$"
                        ;; sub-titles
                        "\\.sub$"
                        "\\.srt$"
                        "\\.ass$"
                        "/ido.last$"
                        ;; ~/.emacs.d/**/*.el included
                        ;; "/home/[a-z]\+/\\.[a-df-z]"
                        ;; configuration file should not be excluded
                        ))

(provide 'init-recentf)
;;; init-misc.el ends here

