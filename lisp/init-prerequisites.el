;; -*- coding:utf-8 -*-


;; operation system detection
(setq *macintosh* (eq system-type 'darwin) )
(setq *windows* (eq system-type 'windows-nt) )
(setq *cygwin* (eq system-type 'cygwin) )
(setq *linux* (or (eq system-type 'gnu/linux) (eq system-type 'linux)) )
(setq *unix* (or *linux* (eq system-type 'usg-unix-v)
                 (eq system-type 'berkeley-unix)) )
(setq *emacs24* (and (not (featurep 'xemacs)) (>= emacs-major-version 24) ) )
(setq *emacs25* (and (not (featurep 'xemacs)) (>= emacs-major-version 25) ) )

;; init-prerequisites ends here
(provide 'init-prerequisites)

