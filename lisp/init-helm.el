;; -*- coding : utf8-*-


(require 'helm-config)


(helm-mode 1)


;; keybindings
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)



(provide 'init-helm)
;;;

