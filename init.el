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
(require 'init-modeline)

(require 'use-package)
(require 'init-recentf)
(require 'init-tabs)
(require 'init-cc-mode)
(require 'init-org-mode)
(require 'init-elisp-mode)
(require 'init-helm)
(require 'init-global)

(require 'init-idle-require)
(idle-require 'init-key-binding)
(idle-require 'sw-split-window)
(idle-require 'init-projectile)
(idle-require 'init-misc-delay)
(idle-require 'init-gdb)
(idle-require 'init-ibuffer)
(idle-require 'init-magit)
(idle-require 'init-smex)
(idle-require 'init-company)
(idle-require 'init-yasnippet)
(idle-require 'init-flycheck)
(idle-require 'init-undo-tree)
(idle-require 'init-exec-path-from-shell)
(idle-require 'init-treemacs)
(idle-require 'init-eshell)
(idle-require 'init-nikola)
(idle-require 'init-dired)

;; finally load elpa packages
;; and install missing packages
(idle-require 'init-elpa)
(idle-require-mode 1)

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

