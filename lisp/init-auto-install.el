

;;==============================================================================
;;  My packages to install (Auto-install)
;;==============================================================================
(require 'elpa-auto-install.el)
(defvar my-packages
  '(smex company ido-vertical-mode yasnippet ivy counsel markdown-mode))
(auto-install-packages my-packages)

;; package to try:
;; expand-region
;; smart-mode-line : makes mode line more powerful
;; neotree : just like nerdtree in vim
;; windows-numbering.el : switch different windows effeciently
;; find-file-in-project : fuzzy search file in project
;; use-packages : when package sum grows too big, try this to manage packages

(provide 'init-auto-install)
;; init-auto-install.el
