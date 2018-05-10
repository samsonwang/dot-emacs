;; -*- coding: utf-8 -*-
;; Custom Settings


;; Setup default open directory
(when *windows* (setq default-directory "~/"))

;; Hide startup message
(setq inhibit-startup-message t)

;; Enable gloabl line wrap
(setq truncate-lines nil)

;; line number
;; (global-linum-mode t)
(setq linum-format "%3d")

;; Force charset page to utf-8
;;(set-language-environment "utf-8") 
;;(set-locale-environment "utf-8")
(setq-default buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'gbk)
(prefer-coding-system 'utf-8-unix)

;; Emacs title bar to reflect file name
(defun frame-title-string ()
  "Return the file name of current buffer, using ~ if under home directory"
  (let ((fname (or (buffer-file-name (current-buffer))
                   (buffer-name) ) ) )
	;;let body
	(when (string-match (getenv "HOME") fname)
	  (setq fname (replace-match "~" t t fname) ) )
    ;; fname is returned
	fname))
;; Title = 'foo.bar @ system-name'
(setq frame-title-format '( (:eval (frame-title-string))
			    " - Emacs @ "system-name" " ) )

;;  Default stracth buffer
(defun scratch-buffer-message ()
  (if (executable-find "fortune")
      (format ";; %s\n\n"
         (replace-regexp-in-string "\n" "\n;; " ; comment each line
            (replace-regexp-in-string
              ; remove trailing linebreak
              "\\(\n$\\|\\|\\[m *\\|\\[[0-9][0-9]m *\\)" ""
              (shell-command-to-string "fortune"))))
    (concat ";; Happy hacking "
            (or user-login-name "")
            " - Emacs loves you!\n\n")))
(setq-default initial-scratch-message (scratch-buffer-message))

(provide 'init-misc)
;;; init-misc.el ends here

