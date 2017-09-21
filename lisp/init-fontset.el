;; -*- coding:utf-8-*-
;; Fontset

(defun set-fontset (english-name chinese-name english-size chinese-size)
  (set-face-attribute 'default nil :font
                      (format  "%s:pixelsize=%d"  english-name english-size))
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font (frame-parameter nil 'font) charset
                      (font-spec :family chinese-name :size chinese-size))))

(when *windows*
   (set-fontset "Consolas" "微软雅黑" 16 16))


;; Set font for windows chinese
;(create-fontset-from-fontset-spec
;;     "-*-consolas-normal-r-*-*-14-*-*-*-*-*-fontset-custom")
;;(set-fontset-font "fontset-custom" 'chinese-gbk "微软雅黑" nil 'prepend)

;; Set custom Fontset to frame
;;(setq default-frame-alist
;;     (append '((font . "fontset-custom")) default-frame-alist))


(provide 'init-fontset)
;;; init-fontset.el

