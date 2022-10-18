;; -*- coding : utf8-*-

(use-package helm
  :diminish (helm-mode)
  :custom
  (helm-ff-cache-mode-lighter "")
  :bind
  (("C-c o"     . helm-occur)
   ("C-x C-f"   . helm-find-files)
   ("M-x"       . helm-M-x)
   ("C-x b"     . helm-mini)
   ("C-x C-b"   . helm-buffers-list)
   ("C-c i"     . helm-imenu)
   ("C-c k"     . helm-show-kill-ring))
  :config
  (helm-mode +1))

(idle-require 'helm)

(provide 'init-helm)
;;; init-helm ends here
