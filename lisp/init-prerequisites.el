;; -*- coding:utf-8 -*-

;; operation system detection
(defconst *macintosh* (eq system-type 'darwin) )
(defconst *windows* (eq system-type 'windows-nt) )
(defconst *cygwin* (eq system-type 'cygwin) )
(defconst *linux* (or (eq system-type 'gnu/linux)
                      (eq system-type 'linux)) )
(defconst *unix* (or *linux* (eq system-type 'usg-unix-v)
                     (eq system-type 'berkeley-unix)) )
(defconst *emacs24* (and (not (featurep 'xemacs))
                         (>= emacs-major-version 24) ) )
(defconst *emacs25* (and (not (featurep 'xemacs))
                         (>= emacs-major-version 25) ) )
(defconst *emacs26* (and (not (featurep 'xemacs))
                         (>= emacs-major-version 26) ) )

;; init config home
;; (setq config-home (file-name-directory load-file-name))
;; (message (concat "Init from: " config-home))
;; (message (concat "user-emacs-directory: " user-emacs-directory))

;; temp file litters config home, put them all int a cache directory
(defconst user-emacs-cache (expand-file-name ".cache/" user-emacs-directory))
(unless (file-exists-p user-emacs-cache)
  (make-directory user-emacs-cache))

;; use-package is required for 2rd priority
(add-to-list 'load-path
             (expand-file-name "site-lisp/use-package" user-emacs-directory))
(require 'use-package)
;; use-package:diminish need this
(use-package diminish
  :config
  (diminish 'eldoc-mode))
;; use-pacakge:bind need this
(use-package bind-key)


(when *windows*
  ;; Setup default open directory
  (setq default-directory "~/")

  ;; extra path, some elisp need this, such as rgrep's find
  (setq extra-path '("d:/Program Files/PortableGit/usr/bin"
                     "d:/Program Files/LLVM/bin"
                     "d:/Program Files/Global/bin"))

  ;; add to exec-path
  (setq exec-path (append exec-path extra-path))

  ;; add to PATH env
  (setenv "PATH"
          (concat (mapconcat 'identity extra-path ";")
                  ";"
                  (getenv "PATH"))))

;; init-prerequisites ends here
(provide 'init-prerequisites)
