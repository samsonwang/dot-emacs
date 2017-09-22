
;; -*- coding:utf-8 -*-

; create the autosave dir if necessary, since emacs won't.

(setq autosave-dir (concat config-home ".emacs_autosaves/") )
(setq backup-dir (concat config-home ".emacs_backups/") )

(if (not (file-exists-p autosave-dir))
  (make-directory autosave-dir) )
(if (not (file-exists-p autosave-dir))
  (make-directory backup-dir) )

(setq
   backup-by-copying t ; don't clobber symlinks
   backup-directory-alist
      '( ( "." . "~/.emacs.d/.emacs_backups/" ) ) ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t) ; use versioned backups

(setq auto-save-file-name-transforms
   '( (".*" "~/.emacs.d/.emacs_autosaves/" t) ) )

(setq auto-save-list-file-prefix
      "~/.emacs.d/.emacs_autosaves/")

;;; init-backup-func.el ends here
(provide 'init-backup)

