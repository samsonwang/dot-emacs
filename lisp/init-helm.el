;; -*- coding : utf8-*-

(use-package helm-config
  :bind
  (("C-c o"     . helm-occur)
   ("C-x C-f"   . helm-find-files)
   ("M-x"       . helm-M-x)
   ("C-x b"     . helm-mini)
   ("C-x C-b"   . helm-buffers-list))
  :config (helm-mode 1))

(provide 'init-helm)
;;; init-helm ends here
