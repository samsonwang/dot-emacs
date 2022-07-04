
(use-package undo-tree
  :diminish undo-tree-mode
  :custom
  (undo-tree-auto-save-history nil)
  :config
  (global-undo-tree-mode))
;;  :bind
;;  (("C-c u" . undo-tree-mode)))

(provide 'init-undo-tree)
