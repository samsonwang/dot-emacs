;; -*- coding: utf-8 -*-

;; show gc message
;; (setq garbage-collection-messages t)

;; Set garbage collection threshold to 1GB.
;; (setq gc-cons-threshold #x40000000)
;; (setq gc-cons-percentage 0.5)

(defmacro eval-time (&rest body)
  "Measure and return the time it takes evaluating BODY."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

;; when idle for 15 sec run gc
(defvar gc-timer
  (run-with-idle-timer 15 t #'garbage-collect))

;; (defvar gc-timer
;;   (run-with-idle-timer 15 t
;;                        (lambda ()
;;                          (message "Garbage Collector has run for %.06f sec"
;;                                   (eval-time (garbage-collect))))))



(provide 'init-gc)
