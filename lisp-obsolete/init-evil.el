
(use-package evil
  :diminish
  undo-tree-mode ;; evil use undo-tree-mode in advance
  :init
  (setq evil-search-module 'evil-search)
  :config
  (evil-mode +1))

(provide 'init-evil)
