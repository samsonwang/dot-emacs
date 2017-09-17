;; -*- coding: utf-8 -*-
;; Emacs Configuration Entrance (init.el)

;; Timing Startup speed
(setq emacs-load-start-time (current-time))

(setq config-home (file-name-directory load-file-name))
(message (concat "Init from: " config-home))

;; Set Best GC thresholdo
(defvar best-gc-cons-threshold 4000000
  "Best default GC threshold value. Should't be too big.")

;; Don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

;; Set package url
;; Prevent Emacs from add (package-initialize)
(setq package--init-file-ensured t)
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives
    '("melpa-stable" . "https://stable.melpa.org/packages/"))
;;  (add-to-list 'package-archives
;;    '("popkit" . "http://elpa.popkit.org/packages/"))
;;  (add-to-list 'package-archives
;;    '("melpa-cn"        . "http://elpa.emacs-china.org/melpa/"))
  (add-to-list 'package-archives
    '("melpa-cn-stable" . "http://elpa.emacs-china.org/melpa-stable/"))
  (package-initialize))

;; Force charset page to utf-8
;;(set-language-environment "utf-8") 
;;(set-locale-environment "utf-8") 
(setq default-buffer-file-coding-system 'utf-8)

;; Additional lisp library
(add-to-list 'load-path (concat config-home "lisp"))
(add-to-list 'load-path (concat config-home "site-lisp"))

;; My Custom Settings
(require 'init-site-lisp)
(require 'init-theme)
(require 'init-fontset)
(require 'init-customization)
(require 'init-key-binding)
(require 'init-backup)
(require 'init-cc-mode)
(require 'init-org-mode)
(require 'init-recentf)
(require 'init-tabs)

(require 'init-elpa)

;;(require 'better-defaults)

;; Put Custom Setting in a single stand alone file
(setq custom-file (concat config-home "custom-set-variables.el"))
(load custom-file 'noerror)

;; Calculate and print startup time
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
    (time-to-seconds (time-since emacs-load-start-time))))

;; Set GC threshold to normal value
(setq gc-cons-threshold best-gc-cons-threshold)

