
;; idle require other stuff
(require 'idle-require)
(setq idle-require-idle-delay 1)
(setq idle-require-load-break 0)
(setq idle-require-message-verbose nil)

;; activate idle require mode
;; (idle-require-mode 1)

;(run-with-idle-timer idle-require-idle-delay t
;                     (lambda() (idle-require-mode 1)))

(provide 'init-idle-require)
;; idle require ends here
