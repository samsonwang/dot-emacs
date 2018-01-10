
(setq-default mode-line-buffer-identification
              (list
               ;; put projectile in the first
               '(:eval (if (file-remote-p default-directory)
                           ""
                         (format "[%s] " (projectile-project-name))))
               (propertized-buffer-identification "%12b")))

;; 对于mode line 的详细设置可以查看以下variable
;; mode-line-format
;; mode-line-modes

;; @see http://emacs-fu.blogspot.com/2011/08/customizing-mode-line.html
;; But I need global-mode-string,
;; @see http://www.delorie.com/gnu/docs/elisp-manual-21/elisp_360.html

(provide 'init-modeline)

