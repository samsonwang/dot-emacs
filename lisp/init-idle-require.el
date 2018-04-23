
;; idle require other stuff
(use-package idle-require
;  :disabled t
  :load-path "site-lisp/idle-require"
  :init
  (setq idle-require-idle-delay 1
        idle-require-load-break 0
        idle-require-message-verbose nil)
  
  ;; idle required path
  (add-to-list 'load-path (expand-file-name "lisp/idle-required"
                                            user-emacs-directory))
  )

(provide 'init-idle-require)
;; idle require ends here

