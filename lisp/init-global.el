;; -*- coding: utf-8 -*-
;; GNU Global Source Code Tag System
;; 

;;===============================================================
;;  Set "GNU gloabl" env, exec-path
;;===============================================================
(setenv "PATH" (concat "d:/Program Files/Emacs/global/bin;" (getenv "PATH")))
(setq exec-path (append exec-path '("d:/Program Files/Emacs/global/bin;")))

;; Set "GNU GLOABL" path
;;(setenv "GTAGSGLOBAL" "d:/Program Files/Emacs/global/bin/global.exe")

;;gtags/global related
;;(load "gtags.el")
;;(autoload 'gtags-mode "gtags" "" t)
;;(setq gtags-suggested-key-mapping t)
;;(setq gtags-auto-update t)


;;(require 'ggtags)
;;(add-hook 'c-mode-common-hook
;;          (lambda ()
;;                (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;                  (ggtags-mode 1))))

;; Please note `file-truename' must be used!
;;(setenv "GTAGSROOT" "d:/Program Files/Emacs/global/bin")

;;gtags/global related
;;(load "gtags.el")
;;(autoload 'gtags-mode "gtags" "" t)
;;(setq gtags-suggested-key-mapping t)
;;(setq gtags-auto-update t)


;; Please note `file-truename' must be used!
(setenv "GTAGSLIBPATH" (concat (file-truename "~/proj2")
                               ":"
                               (file-truename "~/proj1")))
(setenv "MAKEOBJDIRPREFIX" (file-truename "~/"))
;;(setq company-backends '((company-dabbrev-code company-gtags)))


;; use ivy counsel connsel-gtags for navigation
(add-to-list 'load-path (concat config-home "site-lisp/ivy"))
(add-to-list 'load-path (concat config-home "site-lisp/counsel"))

(require 'counsel-gtags)

(ivy-mode 1)

(setq ivy-use-virtual-buffers t)
(setq ivy-height 10)
(setq ivy-count-format "(%d/%d) ")

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-load-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)


;;(global-set-key (kbd "C-c g") 'counsel-git)
;;(global-set-key (kbd "C-c j") 'counsel-git-grep)
;;(global-set-key (kbd "C-c k") 'counsel-ag)
;;(global-set-key (kbd "C-x l") 'counsel-locate)
;;(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)


(provide 'init-global)
;;; init-global.el ends here
