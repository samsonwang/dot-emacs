


(setenv "PATH" (concat "d:/Program Files/Emacs/plink;" (getenv "PATH")))

(require 'tramp)
(setq tramp-default-method "plink")

(provide 'init-tramp)

