;; -*- coding: utf-8 -*-
;; Emacs Configuration Entrance (init.el)

;; Timing Startup speed
(defconst emacs-load-start-time (current-time))

;; Adjust garbage collection thresholds during startup, and thereafter
(defconst normal-gc-cons-threshold (* 20 1024 1024))
(defconst init-gc-cons-threshold (* 128 1024 1024))
(setq gc-cons-threshold init-gc-cons-threshold)
(add-hook 'after-init-hook
          (lambda () (setq gc-cons-threshold normal-gc-cons-threshold)))

;; Set package url
;; Prevent Emacs from add (package-initialize)
(setq package--init-file-ensured t)
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize))

;; init config home
;; (setq config-home (file-name-directory load-file-name))
;; (message (concat "Init from: " config-home))
;; (message (concat "user-emacs-directory: " user-emacs-directory))

;; temp file litters config home, put them all int a cache directory
(defconst user-emacs-cache (expand-file-name ".emacs_cache/" user-emacs-directory))
(unless (file-exists-p user-emacs-cache)
  (make-directory user-emacs-cache))

;; Additional lisp library
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))

;; My Custom Settings
(require 'init-prerequisites)
(require 'init-site-lisp)
(require 'init-theme)
(require 'init-fontset)
(require 'init-encoding)
(require 'init-misc)
(require 'init-backup)

(require 'use-package)
(require 'init-recentf)
(require 'init-tabs)
(require 'init-cc-mode)
(require 'init-org-mode)
(require 'init-elisp-mode)
(require 'init-helm)
(require 'init-global)

;; idle require other stuff
(require 'idle-require)
(setq idle-require-idle-delay 1)
(setq idle-require-load-break 0)
(setq idle-require-message-verbose nil)
(setq idle-require-symbols
      '(init-key-binding
        sw-split-window
        init-projectile
        init-misc-delay
        init-gdb
        init-ibuffer
        init-magit
        init-smex
        init-company
        init-yasnippet
        init-flycheck
        init-undo-tree
        init-exec-path-from-shell
        init-treemacs
        ;; finally load elpa packages
        ;; and install missing packages
        init-elpa))
(idle-require-mode 1) ;; starts loading

;; Put Custom Setting in a single stand alone file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Calculate and print startup time
(when (require 'time-date nil t)
  (message "Emacs startup time: %d seconds."
           (time-to-seconds (time-since emacs-load-start-time))))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:

