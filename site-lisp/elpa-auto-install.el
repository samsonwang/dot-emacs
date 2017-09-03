;; -*- coding: utf-8 -*-
;; Auto install listed packages
;;

;; Add you own package to var my-packages
;; The following function will auto install package listed in "my-package"

(require 'cl-lib)

(defun auto-install-packages (my-packages)
  "Ensure the packages I use are installed. See `my-packages'."
  (interactive)
  (let ((missing-packages (cl-remove-if #'package-installed-p my-packages)))
    (when missing-packages
      (message "Installing %d missing package(s)" (length missing-packages))
      (package-refresh-contents)
      (mapc #'package-install missing-packages))))

(provide 'elpa-auto-install.el)
;;; elpa-auto-install.el ends here
