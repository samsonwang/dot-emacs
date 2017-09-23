;; -*- coding: utf-8 -*-
;; Emacs Configuration Entrance (init.el)

;; Timing Startup speed
(setq emacs-load-start-time (current-time))

;; init config home
(setq config-home (file-name-directory load-file-name))
(message (concat "Init from: " config-home))

;; operation system detection
(setq *macintosh* (eq system-type 'darwin) )
(setq *windows* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v) (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not (featurep 'xemacs)) (>= emacs-major-version 24) ) )
(setq *emacs25* (and (not (featurep 'xemacs)) (>= emacs-major-version 25) ) )

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

;; Force charset page to utf-8
;;(set-language-environment "utf-8") 
;;(set-locale-environment "utf-8") 
(setq default-buffer-file-coding-system 'utf-8)

;; Additional lisp library
(add-to-list 'load-path (concat config-home "lisp"))
(add-to-list 'load-path (concat config-home "site-lisp"))

;; My Custom Settings
(require 'init-theme)
(require 'init-fontset)
(require 'init-misc)
(require 'init-tabs)

;;(require 'init-site-lisp)
;;(require 'init-key-binding)
;;(require 'init-recentf)
;;(require 'init-backup)
;;(require 'init-org-mode)
;;(require 'init-gdb)
;;(require 'init-cc-mode)

;; idle require other stuff
(require 'idle-require)
(setq idle-require-idle-delay 1)
(setq idle-require-load-break 0)
(setq idle-require-message-verbose nil)
(setq idle-require-symbols
      '(init-site-lisp
        init-key-binding
        init-backup
        init-recentf
        init-org-mode
        init-cc-mode
        init-gdb
        ;; finally load elpa packages
        init-elpa))
(idle-require-mode 1) ;; starts loading

;;(require 'init-elpa)

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

