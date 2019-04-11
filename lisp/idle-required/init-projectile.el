

(require 'use-package)

(use-package projectile
  :diminish projectile-mode
  :after
  (helm helm-projectile)

  :init
  (custom-set-variables
   '(projectile-completion-system 'helm)
   '(projectile-cache-file
     (concat user-emacs-cache "projectile.cache"))
   '(projectile-known-projects-file
     (concat user-emacs-cache "projectile.bookmarks"))
   '(projectile-mode-line
     '(:eval (if (file-remote-p default-directory)
                 " Projectile"
               (format " [%s]" (projectile-project-name)))))
   )

  ;; projectile bug #1382
  ;; https://github.com/bbatsov/projectile/issues/1382
  (require 'subr-x)

  :bind
  (("C-c p f"  . projectile-find-file)
   ("C-c p p"  . projectile-switch-project)
   ("C-c p r"  . projectile-recentf)
   ("C-c p i"  . projectile-invalidate-cache)
   )

  :config
  (projectile-global-mode))

(provide 'init-projectile)
;; init-projectile.el ends here
