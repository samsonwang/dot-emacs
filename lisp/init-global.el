;; -*- coding: utf-8 -*-
;; GNU Global Source Code Tag System
;; 

;; use helm-gtags for global front end

(require 'use-package)

(use-package helm-gtags
  :diminish helm-gtags-mode
  :after (helm)
  :init
  (add-hook 'c-mode-hook 'helm-gtags-mode)
  (add-hook 'c++-mode-hook 'helm-gtags-mode)
  (add-hook 'asm-mode-hook 'helm-gtags-mode)

  :config
  ;; customize
  (custom-set-variables
   '(helm-gtags-path-style 'relative)
   '(helm-gtags-ignore-case t)
   '(helm-gtags-auto-update t))
  
  :bind
  (:map helm-gtags-mode-map
        ("M-t" . helm-gtags-find-tag)
        ("M-r" . helm-gtags-find-rtag)
        ("M-s" . helm-gtags-find-symbol)
        ("M-," . helm-gtags-previous-history)
        ("M-." . helm-gtags-next-history))
  )

;; key bindings
;(with-eval-after-load 'helm-gtags
;  (define-key helm-gtags-mode-map (kbd "M-t") 'helm-gtags-find-tag)
;  (define-key helm-gtags-mode-map (kbd "M-r") 'helm-gtags-find-rtag)
;  (define-key helm-gtags-mode-map (kbd "M-s") 'helm-gtags-find-symbol)
;  (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
;  (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;  (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;  (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack))

;;===============================================================
;;  Set "GNU gloabl" env, exec-path
;;===============================================================
;;(setenv "PATH" (concat "d:/Program Files/Emacs/global/bin;" (getenv "PATH")))
;;(setq exec-path (append exec-path '("d:/Program Files/Emacs/global/bin;")))

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
;;(setenv "GTAGSLIBPATH" (concat (file-truename "~/proj2")
;;                               ":"
;;                               (file-truename "~/proj1")))
;;(setenv "MAKEOBJDIRPREFIX" (file-truename "~/"))
;;(setq company-backends '((company-dabbrev-code company-gtags)))



;; Local Variables:
;; no-byte-compile: t
;; End:

(provide 'init-global)
;;; init-global.el ends here

