;;; -*- lexical-binding: t -*-

(setq package-enable-at-startup nil)

;; adjust garbage collection thresholds during startup, and thereafter
(defconst normal-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil)

(setq gc-cons-percentage 0.6)
(setq gc-cons-threshold (* 1024 1024 1024)) ;; 1GB

(defun emacs-startup-hook-func ()
  (setq file-name-handler-alist normal-file-name-handler-alist))
(add-hook 'emacs-startup-hook #'emacs-startup-hook-func)
