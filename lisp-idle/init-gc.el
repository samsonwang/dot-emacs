;; -*- coding: utf-8 -*-

;; show gc message
(setq garbage-collection-messages t)

;; Set garbage collection threshold to 1GB.
;; (setq gc-cons-threshold #x40000000)
;; (setq gc-cons-percentage 0.5)

(defun gc-with-timing ()
  "Execute garbage collection and show elapsed time (only when garbage-collection-messages is non-nil)"
  (interactive)
  (let ((start-time (float-time)))
    (garbage-collect)
    (let ((elapsed-time (- (float-time) start-time)))
      (when garbage-collection-messages
        (message "Garbage collection completed, elapsed: %.3f seconds" elapsed-time)))))

(defvar gc-timer
  (run-with-idle-timer 300 t #'gc-with-timing)) ;; gc every 5 min

(provide 'init-gc)
