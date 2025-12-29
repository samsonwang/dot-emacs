;; -*- coding:utf-8 -*-

;; Use y/n for short
(fset 'yes-or-no-p 'y-or-n-p)

;; ask before quit
(setq confirm-kill-emacs 'y-or-n-p)

;; replace highlighted when type
(delete-selection-mode +1)

;; highlight the current line
;; (global-hl-line-mode +1)

;; Show paired parentheses
(show-paren-mode +1)

;; insert parentheses in pairs
(electric-pair-mode +1)
(setq electric-pair-preserve-balance nil)

;; delete files to trash, as an extra layer of precaution against
;; accidentally deleting wanted files.
(setq delete-by-moving-to-trash t)

;; show the cursor when moving after big movements in the window
(require 'beacon)
(beacon-mode +1)
(diminish 'beacon-mode)

;; show available keybindings after you start typing
(require 'which-key)
(which-key-mode +1)
(diminish 'which-key-mode)

;; Display system time in modeline
;; (setq display-time-24hr-format t)
;; (setq display-time-day-and-date t)
(setq system-time-locale "C")  ;; Change time display into English
;; (display-time)

;;  Fancy display for diary and calendar
(setq calendar-view-diary-initially-flag t
      calendar-mark-diary-entries-flag t
      number-of-diary-entries 7)
(add-hook 'diary-display-hook 'fancy-diary-display)
(add-hook 'today-visible-calendar-hook 'calendar-mark-today)

;; I do not use diary, so put diary in a temp folder.
(setq diary-file (expand-file-name "diary" user-emacs-cache))
(when (and (boundp 'diary-file)
           diary-file
           (not (file-exists-p diary-file)))
  (make-directory (file-name-directory diary-file) t)
  (write-region "" nil diary-file))

;; Warning signal by flash modeline
(defun mode-line-bell-flash ()
  "Flash the mode line momentarily"
  (invert-face 'mode-line)
  (run-with-timer 0.1 nil 'invert-face 'mode-line))
(setq-default ring-bell-function 'mode-line-bell-flash)

;; delete trailling space before save
;; (add-hook 'before-save-hook #'whitespace-cleanup)
;; (add-hook 'before-save-hook #'delete-trailing-whitespace)

(defun create-scratch-buffer ()
  "create a new scratch buffer to work in.
   (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname
                   (concat "*scratch"
                           (if (= n 0) "" (int-to-string n))
                           "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (lisp-interaction-mode)
    (setq buffer-offer-save t) ; prevent data loss
    (insert (scratch-buffer-message))))


(defun byte-compile-init-dir ()
  "Byte-compile all your lisp files."
  (interactive)
  (byte-recompile-directory
   (expand-file-name "lisp" user-emacs-directory) 0))

;; site lisp directory for load path
(defun init-site-lisp-load-path ()
  (eval-when-compile (require 'cl-lib))
  (if (fboundp 'normal-top-level-add-to-load-path)
      (let* ((site-lisp-dir "~/.emacs.d/lisp-site/")
             (default-directory site-lisp-dir))
        (progn
          (setq load-path
                (append
                 (cl-loop for dir in (directory-files site-lisp-dir)
                          unless (string-match "^\\." dir)
                          collecting (expand-file-name dir))
                 load-path))))))

(defun disable-auto-indent()
  "disable auto indent for this buffer temporary"
  (interactive)
  (electric-indent-local-mode -1)
  (aggressive-indent-mode -1)
  (message "auto-indent disabled"))

;; org file export to rst
;; (use-package ox-rst
;;  :load-path "lisp-site/ox-rst")

;; matlab files
(use-package octave
  :mode ("\\.m\\'" . octave-mode))

;; qt files
(use-package qt-pro-mode
  :mode ("\\.pro\\'" . qt-pro-mode))

;; actually, I do not need idlwave-mode, *.pro file defaults to idlwave, and I changed
;; it to qt-pro-mode
;; put idlwave directory in cache
;;(custom-set-variables
;; '(idlwave-config-directory
;;   (concat user-emacs-cache "idlwave")))
;;(use-package idlwave
;;  :custom
;;  (idlwave-config-directory (expand-file-name "idlwave/" user-emacs-cache)))

;; gnupg easypg
(use-package epa-file
  :custom
  (epg-gpg-home-directory "~/.gnupg/")
  (epg-gpg-program (executable-find "gpg"))
  (epg-gpgconf-program (executable-find "gpgconf"))
  :config
  (epa-file-enable))

;; eshell
(use-package eshell
  :custom
  (eshell-directory-name (expand-file-name "eshell/" user-emacs-cache)))

;; url
(use-package url
  :custom
  (url-configuration-directory (expand-file-name "url/" user-emacs-cache)))

(use-package hideshow
  :ensure nil
  :diminish hs-minor-mode
  :bind (:map prog-mode-map
              ("C-c TAB" . hs-toggle-hiding)
              ("M-+" . hs-show-all))
  :hook (prog-mode . hs-minor-mode)
  :custom
  (hs-special-modes-alist
   (mapcar 'purecopy
           '((c-mode "{" "}" "/[*/]" nil nil)
             (c++-mode "{" "}" "/[*/]" nil nil)
             (rust-mode "{" "}" "/[*/]" nil nil)))))

(use-package subword
  ;;:hook (after-init . global-subword-mode)
  :diminish subword-mode)
;;  :custom (global-subword-mode))

(use-package nsm
  :custom
  (nsm-settings-file
   (expand-file-name "network-security.data" user-emacs-cache)))

(use-package tramp
  :custom
  (tramp-persistency-file-name
   (expand-file-name "tramp" user-emacs-cache)))

;; misc delay is returned
(provide 'init-misc-delay)
