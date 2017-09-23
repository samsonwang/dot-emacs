
;; -*- coding:utf-8 -*-

(setq autosave-dir (concat config-home ".emacs_autosaves/") )
(setq backup-dir (concat config-home ".emacs_backups/") )

; create the autosave dir if necessary, since emacs won't.
(unless (file-exists-p autosave-dir)
  (make-directory autosave-dir) )

(unless (file-exists-p backup-dir)
  (make-directory backup-dir) )

(setq
   backup-by-copying t ; don't clobber symlinks
   backup-directory-alist
      `( ( "." . ,backup-dir ) ) ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t) ; use versioned backups

(setq auto-save-file-name-transforms
      `( (".*" ,autosave-dir t) ) )

(setq auto-save-list-file-prefix autosave-dir)

;;; init-backup-func.el ends here
(provide 'init-backup)

