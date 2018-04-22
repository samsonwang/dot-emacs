
;; idle require other stuff
(defconst idle-require-path
  (expand-file-name
   "site-lisp/idle-require/idle-require.el"
   user-emacs-directory))

(require 'idle-require idle-require-path)
(setq idle-require-idle-delay 1)
(setq idle-require-load-break 0)
(setq idle-require-message-verbose nil)

;; idle required path
(add-to-list 'load-path (expand-file-name "lisp/idle-required"
                                          user-emacs-directory))

(provide 'init-idle-require)
;; idle require ends here

