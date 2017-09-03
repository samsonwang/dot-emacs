;; -*- coding:utf-8 -*-

(setq
   backup-by-copying t ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.emacs_backups")) ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t) ; use versioned backups

;;; init-backup-func.el ends here
(provide 'init-backup)

