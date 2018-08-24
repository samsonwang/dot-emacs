
(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (defun python-mode-hook-func()
    "hook func for python mode"
    (setq python-indent-offset 4)
    ;;  (setq indent-tabs-mode t)
    ;;  (setq tab-width 4)
    (aggressive-indent-mode)
    (linum-mode))

  (add-hook 'python-mode-hook
            #'python-mode-hook-func)
  )

(provide 'init-python-mode)

