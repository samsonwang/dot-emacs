;; -*- coding: utf-8 -*-
;; ivy counsel settings

;(add-to-list 'load-path (concat config-home "site-lisp/ivy"))
;(add-to-list 'load-path (concat config-home "site-lisp/counsel"))

(require 'ivy)
(require 'counsel)

(ivy-mode 1)

(setq ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)

(provide 'init-ivy)
;;; init-ivy.el ends here

