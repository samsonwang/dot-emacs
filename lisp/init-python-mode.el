


(use-package python
  :mode ("\\.py\\'" . python-mode)
  :interpreter ("python" . python-mode)
  :init
  (add-hook 'python-mode-hook
            (lambda ()
              (setq indent-tabs-mode t)
              (setq tab-width 4)))

  )

(provide 'init-python-mode)

