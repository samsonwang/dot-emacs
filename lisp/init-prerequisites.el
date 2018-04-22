;; -*- coding:utf-8 -*-

;; operation system detection
(setq *macintosh* (eq system-type 'darwin) )
(setq *windows* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux)
                  (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v)
                 (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not (featurep 'xemacs))
                     (>= emacs-major-version 24) ) )
(setq *emacs25* (and (not (featurep 'xemacs))
                     (>= emacs-major-version 25) ) )

;; init config home
;; (setq config-home (file-name-directory load-file-name))
;; (message (concat "Init from: " config-home))
;; (message (concat "user-emacs-directory: " user-emacs-directory))

;; temp file litters config home, put them all int a cache directory
(defconst user-emacs-cache
  (expand-file-name ".emacs_cache/" user-emacs-directory))
(unless (file-exists-p user-emacs-cache)
  (make-directory user-emacs-cache))

;; init-prerequisites ends here
(provide 'init-prerequisites)

