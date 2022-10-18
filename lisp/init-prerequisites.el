;; -*- coding:utf-8 -*-

;; operation system detection
(defconst *macintosh* (eq system-type 'darwin) )
(defconst *windows* (eq system-type 'windows-nt) )
(defconst *cygwin* (eq system-type 'cygwin) )
(defconst *linux* (or (eq system-type 'gnu/linux)
                      (eq system-type 'linux)) )
(defconst *unix* (or *linux* (eq system-type 'usg-unix-v)
                     (eq system-type 'berkeley-unix)) )

(defconst *emacs25* (and (not (featurep 'xemacs))
                         (>= emacs-major-version 25) ) )
(defconst *emacs26* (and (not (featurep 'xemacs))
                         (>= emacs-major-version 26) ) )
(defconst *emacs27* (and (not (featurep 'xemacs))
                         (>= emacs-major-version 27) ) )

(defconst *gnutls* (null (gnutls-available-p)))

;; Put Custom Setting in a single stand alone file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; temp file litters config home, put them all int a cache directory
;;(defconst user-emacs-cache (expand-file-name ".cache/" user-emacs-directory))
(defconst user-emacs-cache "~/.cache/emacs/")
(unless (file-exists-p user-emacs-cache)
  (make-directory user-emacs-cache t))

(require 'package)

;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
(let ((versioned-package-dir
       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
                         user-emacs-directory)))
  (setq package-user-dir versioned-package-dir))

;; prevent from adding (package-initialize)
(setq package--init-file-ensured t)
;; prevent from loading packages twice
(setq package-enable-at-startup nil)
(package-initialize)

;; init config home
;; (setq config-home (file-name-directory load-file-name))
;; (message (concat "Init from: " config-home))
;; (message (concat "user-emacs-directory: " user-emacs-directory))

;; use-package is required for 2rd priority
(unless (require 'use-package nil 'noerror)
  (add-to-list 'load-path
               (expand-file-name "lisp-site/use-package" user-emacs-directory))
  (message "loading lisp-site/use-package")
  (require 'use-package))

;; use-package:diminish need this
(use-package diminish
  :config
  (diminish 'eldoc-mode))
;; use-pacakge:bind need this
(use-package bind-key)

;; idle require other stuff
(use-package idle-require
  :load-path "lisp-site/idle-require"
  :init
  ;; start idle-require after init finish
  (defun after-init-hook-func ()
    (add-to-list 'load-path
                 (expand-file-name "lisp-idle" user-emacs-directory))
    (idle-require-mode +1))
  (add-hook 'after-init-hook #'after-init-hook-func)

  (defun idle-require-finish-hook-func ()
    (message (concat "Emacs is ready, " (startup-echo-area-message))))
  (add-hook 'idle-require-finish-hook #'idle-require-finish-hook-func)

  :custom
  (idle-require-idle-delay 1)
  (idle-require-load-break 0)
  (idle-require-message-verbose nil))

(when *windows*
  ;; setup default open directory
  (setq default-directory "~/")

  ;; extra path, some elisp need this, such as rgrep's find
  (setq extra-path '("d:/Program Files/PortableGit/bin"
                     "d:/Program Files/PortableGit/usr/bin"
                     "d:/Program Files/LLVM/bin"
                     "d:/Program Files/Global/bin"))

  ;; add to exec-path
  (setq exec-path (append exec-path extra-path))

  ;; add to PATH env
  (setenv "PATH"
          (concat (mapconcat 'identity extra-path ";")
                  ";"
                  (getenv "PATH"))))

(provide 'init-prerequisites)
;; init-prerequisites ends here
