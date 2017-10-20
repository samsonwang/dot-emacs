

;; setup org blog public

(require 'ox-publish)
(setq org-publish-project-alist
      `(("org-blog"
         :base-directory "~/org-blog"
         :recursive t
         :publishing-directory "~/org-blog-output"
         :html-head-extra "<link rel=\"stylesheet\" type=\"text/css\" href=\"../worg.css\">"
         :publishing-function org-html-publish-to-html)))

(defun publish-blog ()
  (interactive)
  "publish my blog "
    (org-publish "org-blog" t))

(provide 'init-org-blog)

