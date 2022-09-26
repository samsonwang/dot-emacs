;; -*- coding: utf-8 -*-
;; Emacs Configuration Entrance (init.el)

;; adjust garbage collection thresholds during startup, and thereafter
(defconst normal-file-name-handler-alist file-name-handler-alist)
(setq file-name-handler-alist nil
      ;; gc-cons-percentage 0.5
      gc-cons-threshold most-positive-fixnum) ;; 1GB
(defun emacs-startup-hook-func ()
  (setq file-name-handler-alist normal-file-name-handler-alist))
(add-hook 'emacs-startup-hook #'emacs-startup-hook-func)

;; basic load path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; My Custom Settings
;; 1st priority, core customization
(require 'init-prerequisites)
(require 'init-ui)
(require 'init-editor)
(require 'init-backup)
(require 'init-recentf)
;; (require 'init-evil)
(require 'init-helm)
(require 'init-global)
(require 'init-elisp-mode)
(require 'init-cc-mode)
(require 'init-python-mode)
(require 'init-org-mode)
(require 'init-log-mode)
(require 'init-server)

;; 2rd priority is loaded after init when idle
(require 'init-idle-require)
(idle-require 'init-js-mode)
(idle-require 'init-css-mode)
(idle-require 'init-go-mode)
(idle-require 'init-vimrc-mode)
(idle-require 'init-misc-delay)
(idle-require 'init-key-binding)
(idle-require 'init-window)
(idle-require 'init-projectile)
;; (idle-require 'init-gdb)
(idle-require 'init-ibuffer)
;; (idle-require 'init-magit)
(idle-require 'init-smex)
(idle-require 'init-company)
(idle-require 'init-yasnippet)
;; (idle-require 'init-flycheck)
(idle-require 'init-undo-tree)
(idle-require 'init-exec-path-from-shell)
;; (idle-require 'init-nikola)
(idle-require 'init-dired)
(idle-require 'init-window-margin)
;; (idle-require 'init-pyim)
;; (idle-require 'init-elfeed)
(idle-require 'init-gc)
(idle-require 'init-elpa) ;; finally load and install elpa packages


;; (load custom-file 'noerror t)
(when (file-exists-p custom-file)
  (load custom-file))

;; personal file
(defconst personal-file (expand-file-name "personal.el" user-emacs-directory))
(load personal-file 'noerror t)

;; print startup time
(message "Emacs startup time: %s" (emacs-init-time))

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: t
;; End:
