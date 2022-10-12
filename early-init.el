;;; -*- lexical-binding: t -*-

;; adjust garbage collection thresholds during startup, and thereafter
(defconst normal-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil
      ;; gc-cons-percentage 0.5
      gc-cons-threshold most-positive-fixnum) ;; 1GB
(defun emacs-startup-hook-func ()
  (setq file-name-handler-alist normal-file-name-handler-alist))
(add-hook 'emacs-startup-hook #'emacs-startup-hook-func)
