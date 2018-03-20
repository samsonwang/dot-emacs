;; -*- coding:utf-8-*-

;; Fontset
(defun set-fontset (english-name chinese-name english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format  "%s:pixelsize=%d"  english-name english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese-name :size chinese-size))))
(when (display-graphic-p) 
  (when *windows*
    (set-fontset "Consolas" "微软雅黑" 16 16))
  (when *macintosh*
    (set-fontset "Menlo" "Menlo" 16 16))
  (when (and *linux* (display-graphic-p))
    (set-fontset "Mono" "Sans" 16 16)))

(provide 'init-fontset)
;;; init-fontset.el

