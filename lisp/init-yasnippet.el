

(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs
        (expand-file-name "snippets" user-emacs-directory))
  
  :config
  (setq yas-verbosity 0)
  (yas-global-mode 1)
  (setq yas-verbosity 3))

(provide 'init-yasnippet)

