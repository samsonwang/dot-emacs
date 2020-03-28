
;; no littering
(setq-default
 logview-views-file (concat user-emacs-cache "logview.views")
 logview-cache-filename (concat user-emacs-cache "logview-cache.extmap"))

(use-package logview
  ;; :interpreter ("logview" . logview-mode)
  :init
  (defun logview-mode-hook-func ()
    "hook func for log view mode"
    (toggle-truncate-lines nil)
    (auto-revert-mode)
    (read-only-mode)
    (hl-line-mode)
    ;;    (logview-choose-submode "cpp" "cpp")
    )

  (add-hook 'logview-mode-hook #'logview-mode-hook-func)

  :config
  ;;(setq logview-auto-revert-mode 'auto-revert-mode)
  ;;(setq datetime-timezone "Asia/Shanghai")
  ;; self-defined log format
  (setq logview-additional-timestamp-formats
        '(("cpp"
           (java-pattern . "yyyy-MM-dd HH:mm:ss.SSSSSS"))))
  (setq logview-additional-level-mappings
        '(("cpp" . ((error       "<error>")
                    (warning     "<warning>")
                    (information "<info>")
                    (debug       "<debug>")
                    (trace       "<trace>")))))
  (setq logview-additional-submodes
        '(("cpp" . ((format  . "TIMESTAMP LEVEL -")
                    (levels  . "cpp")))))

  ;;:custom
  ;; no littering
  ;; (logview-views-file (concat user-emacs-cache "logview.views"))
  ;; (logview-cache-filename (concat user-emacs-cache "logview-cache.extmap"))
  )

(provide 'init-logview-mode)
