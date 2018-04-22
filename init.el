;; -*- coding: utf-8 -*-
;; Emacs Configuration Entrance (init.el)

;; Timing Startup speed
(defconst emacs-load-start-time (current-time))

;; Adjust garbage collection thresholds during startup, and thereafter
(defconst normal-gc-cons-threshold (* 20 1024 1024))
(defconst normal-file-name-handler-alist file-name-handler-alist)
(setq gc-cons-threshold (* 128 1024 1024)
      gc-cons-percentage 0.6
      file-name-handler-alist nil)
(defun after-init-hook-func ()
  (setq gc-cons-threshold normal-gc-cons-threshold
        gc-cons-percentage 0.1
        file-name-handler-alist normal-file-name-handler-alist))
(add-hook 'after-init-hook #'after-init-hook-func)

;; Prevent Emacs from adding (package-initialize)
(setq package--init-file-ensured t)

;; basic load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; My Custom Settings
;; 1st priority, core customization
(require 'init-prerequisites)
(require 'init-theme)
(require 'init-backup)
(require 'init-tabs)
(require 'init-misc)

;; 2nd priority, use-package based config
(require 'use-package)
(require 'init-recentf)
(require 'init-cc-mode)
(require 'init-org-mode)
(require 'init-elisp-mode)
(require 'init-python-mode)
(require 'init-helm)
(require 'init-global)
(require 'init-highlight-symbol)

;; 3rd priority is loaded after init when idle
(require 'init-idle-require)
(idle-require 'init-misc-delay)
(idle-require 'init-key-binding)
(idle-require 'init-window)
(idle-require 'init-projectile)
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
(idle-require 'init-window-margin)
(idle-require 'init-elpa) ;; finally load and install elpa packages
(idle-require-mode 1)

;; Put Custom Setting in a single stand alone file
(defconst custom-file (expand-emacs-home "custom.el"))
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

