

(use-package elfeed
  :config
  (setq elfeed-show-entry-switch #'pop-to-buffer
        elfeed-show-entry-delete #'delete-window
        elfeed-feeds '("http://blog.wangzhl.com/rss.xml")))

(provide 'init-elfeed)
