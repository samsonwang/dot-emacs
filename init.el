;; -*- coding: utf-8 -*-
;; Emacs Configuration Entrance (init.el)

;; Timing Startup speed
(setq emacs-load-start-time (current-time))

;; init config home
(setq config-home (file-name-directory load-file-name))
(message (concat "Init from: " config-home))
(message (concat "user-emacs-directory: " user-emacs-directory))

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
  (package-initialize))

;; Additional lisp library
(add-to-list 'load-path (concat config-home "lisp"))
(add-to-list 'load-path (concat config-home "site-lisp"))

;; My Custom Settings
(require 'init-prerequisites)
(require 'init-site-lisp)
(require 'init-theme)
(require 'init-fontset)
(require 'init-encoding)
(require 'init-misc)
(require 'init-backup)
(require 'sw-split-window)

(require 'use-package)
(require 'init-recentf)
(require 'init-tabs)
(require 'init-cc-mode)
(require 'init-org-mode)
(require 'init-elisp-mode)
(require 'init-helm)
(require 'init-projectile)

;;(require 'init-org-blog)

;;(require 'init-key1-binding)
;;(require 'init-gdb)

;; idle require other stuff
(require 'idle-require)
(setq idle-require-idle-delay 1)
(setq idle-require-load-break 0)
(setq idle-require-message-verbose nil)
(setq idle-require-symbols
      '(init-key-binding
        init-misc-delay
        init-gdb
        init-ibuffer
        ;; finally load elpa packages
        init-elpa
        ))
(idle-require-mode 1) ;; starts loading

;; Put Custom Setting in a single stand alone file
(setq custom-file (concat config-home "custom-set-variables.el"))
(load custom-file 'noerror)

;; Calculate and print startup time
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))

;; Set GC threshold to normal value
(setq gc-cons-threshold best-gc-cons-threshold)

