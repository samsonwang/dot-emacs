
(use-package pyim
  :load-path "site-lisp/pyim"
  :ensure nil
  :demand t
  :bind
  (("M-j" . pyim-convert-code-at-point) ;; 与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer))

  :config
  ;; 激活 basedict 拼音词库，五笔用户请继续阅读 README
  (use-package pyim-basedict
    :load-path "site-lisp/pyim-basedict"
    :ensure nil
    :config (pyim-basedict-enable))

  (setq default-input-method "pyim")

  ;; 我使用全拼
  (setq pyim-default-scheme 'quanpin)

  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  ;; 开启拼音搜索功能
  ;;  (pyim-isearch-mode 1)

  ;; 使用 popup-el 来绘制选词框, 如果用 emacs26, 建议设置
  ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
  ;; 手动安装 posframe 包。
  (if (fboundp 'posframe)
      (setq pyim-page-tooltip 'posframe)
    (setq pyim-page-tooltip 'popup))

  :custom
  (pyim-message-verbose nil)
  (pyim-page-length 5) ;; 选词框显示候选词
  (pyim-title "pyim ") ;; 在modeline中显示的名称
  (pyim-dcache-directory (concat user-emacs-cache "pyim")))

;; pyim定制记录
;; 1. pyim-title变为可配置项
;; 2. 隐藏了一些比较罗嗦的信息


(provide 'init-pyim)
