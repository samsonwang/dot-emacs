


(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (setq-default python-indent-offset 4)
  (add-hook 'python-mode-hook
            (lambda ()
              (setq indent-tabs-mode t)
              (setq tab-width 4)))

  )

(provide 'init-python-mode)

