
(use-package projectile
  :diminish projectile-mode
  :after (helm)
  :bind
  ("C-c p f"  . projectile-find-file)
  ("C-c p p"  . projectile-switch-project)
  ("C-c p r"  . projectile-recentf)
  ("C-c p i"  . projectile-invalidate-cache)

  :init
  (projectile-mode +1)

  :config
  ;; (require 'helm)
  ;; (require 'helm-projectile)

  ;; modeline setting
  (setq-default mode-line-buffer-identification
                (list
                 ;; put projectile in the first
                 '(:eval (if (fboundp #'projectile-project-name)
                             (format "[%s] " (funcall #'projectile-project-name))))
                 (propertized-buffer-identification "%12b")))
  ;; (message (funcall projectile-project-name))

  ;; projectile issue #1382
  ;; https://github.com/bbatsov/projectile/issues/1382
  ;; (require 'subr-x)

  :custom
  (projectile-completion-system 'helm)
  (projectile-cache-file (concat user-emacs-cache "projectile.cache"))
  (projectile-known-projects-file (concat user-emacs-cache "projectile.bookmarks"))
  ;;  (projectile-mode-line
  ;;   '(:eval (if (file-remote-p default-directory)
  ;;               " Projectile"
  ;;             (format " [%s]" (projectile-project-name)))))
  )

(idle-require 'projectile)

(provide 'init-projectile)
;; init-projectile.el ends here
