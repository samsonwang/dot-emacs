
;; always use space instead of tab
(setq-default indent-tabs-mode nil)

;; use indent as complete
(setq-default tab-always-indent 'complete)

;; default tab width
(setq-default tab-width 4)

;; Force charset page to utf-8
;;(set-language-environment "utf-8")
;;(set-locale-environment "utf-8")
(setq-default buffer-file-coding-system 'utf-8-unix)
(prefer-coding-system 'gbk)
(prefer-coding-system 'utf-8-unix)

;; aggressive indent
(use-package aggressive-indent
  :diminish aggressive-indent-mode)

;; nice scrolling
(setq scroll-margin 3
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; enable gloabl line wrap
(setq truncate-lines nil)

;; predicate buffer is too big
(defun buffer-too-big-p ()
  (or (> (buffer-size) (* 3000 80))
      (> (line-number-at-pos (point-max)) 3000)))

;; display line number
;; linum-mode is slow on large files
(if *emacs26*
    (use-package display-line-numbers
      :custom
      (display-line-numbers-type t)
      ;; (display-line-numbers-grow-only nil)
      ;; (display-line-numbers-width-start t)
      ;; (display-line-numbers-widen t)
      :config
      (set-face-attribute 'line-number nil
                          :foreground "#565761")
      ;;(set-face-attribute 'line-number-current-line nil
      ;;                    :background "white" :foreground "black")
      (defun display-margin-line-number ()
        (unless (buffer-too-big-p)
          (display-line-numbers-mode)))
      (defun toggle-margin-line-number ()
        (interactive)
        (if display-line-numbers-mode
            (display-line-numbers-mode -1)
          (display-line-numbers-mode +1))))
  (use-package linum
    :init
    (if (display-graphic-p)
        ;; line number
        (setq linum-format "%3d")
      ;; line number in terminal need addtional space
      (setq linum-format "%3d "))
    :config
    (defun display-margin-line-number ()
      (unless (buffer-too-big-p)
        (linum-mode)))
    (defun toggle-margin-line-number ()
      (interactive)
      (if linum-mode
          (linum-mode -1)
        (linum-mode +1)))))


;; show column number in modeline
(setq column-number-mode t)

(provide 'init-editor)
