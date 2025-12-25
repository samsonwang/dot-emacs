;; -*- coding:utf-8 -*-
;; Customize org-mode

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :interpreter ("org" . org-mode)
  ;; I wonder why this failed to diminish org-indent-mode
  :diminish org-indent-mode
  :bind
  (("C-c 0"     . org-capture)
   ("C-c 9"     . org-agenda)
   ("C-c 。"    . org-time-stamp))
  :init
  (defun org-mode-hook-func ()
    ;; emacs30.1 requires tab-width set to 8
    ;; (setq tab-width 2)
    (setq truncate-lines nil)
    (display-margin-line-number))

  (add-hook 'org-mode-hook 'org-mode-hook-func)

  (defun org-count-headings ()
    "Count all headings in the current Org buffer."
    (interactive)
    (let ((count 0))
      (org-element-map (org-element-parse-buffer) 'headline
        (lambda (headline) (setq count (1+ count))))
      (message "Total headings: %d" count)))

  ;; Count headings at specific level
  (defun org-count-headings-at-level (level)
    "Count headings at specified LEVEL."
    (interactive "nLevel: ")
    (let ((count 0))
      (org-element-map (org-element-parse-buffer) 'headline
        (lambda (headline)
          (when (= (org-element-property :level headline) level)
            (setq count (1+ count)))))
      (message "Level %d headings: %d" level count)))

  :config
  ;; @https://emacs.stackexchange.com/questions/13820/inline-verbatim-and-code-with-quotes-in-org-mode
  (setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n")
  (org-set-emph-re 'org-emphasis-regexp-components
                   org-emphasis-regexp-components)

  (set-face-attribute 'org-document-title nil :height 1.1)
  ;; (set-face-attribute 'org-level-1 nil :height 1 :bold t)
  ;; (set-face-attribute 'org-level-2 nil :height 1)
  ;; (set-face-attribute 'org-level-3 nil :height 1)

  :custom
  (org-agenda-files '("~/.agenda/"))
  (org-id-locations-file (expand-file-name "org-id-locations" user-emacs-cache))
  ;; (org-default-notes-file "~/.agenda/notes.org")
  (org-adapt-indentation nil) ; do not indent
  (org-startup-folded 'content) ; org startup expand all headlines
  (org-support-shift-select t) ; enable shift selecting
  (org-src-fontify-natively t) ; syntax highlight in emacs begin_src block
  (org-edit-src-content-indentation 0)
  ;; (org-todo-keywords '((sequence "TODO" "PENDING" "FEEDBACK" "|"
  ;;                     "Done" "CANCELED"))) ; Add todo keywords
  )

(use-package org-roam
  :init
  ;; check note directory exist and set org-roam-directory
  (let ((note-dir (file-truename "~/note-org-mode")))
    (if (file-exists-p note-dir)
        (setq org-roam-directory note-dir)))
  
  (defun org-roam-slug-keep-hyphen (title)
    "Generate slug from TITLE, keeping hyphens."
    (let ((s (downcase title)))
      (setq s (replace-regexp-in-string "[^a-z0-9-]" "-" s))
      (setq s (replace-regexp-in-string "-+" "-" s))
      (string-trim s "-+" "-+")))
  
  :custom
  ;; (org-roam-directory (file-truename "~/note-org-mode"))
  (org-roam-db-location (expand-file-name "org-roam.db" user-emacs-cache))
  (org-roam-capture-templates
   '(("d" "default" plain "%?"
      :target (file+head
               "00-default/%<%Y%m%d>-%(org-roam-slug-keep-hyphen \"${title}\").org"
               "#+title: ${title}\n#+date: %U\n#+last_modified: %U\n")
      :unnarrowed t)
     
     ("l" "life" plain "%?"
      :target (file+head
               "30-life/%<%Y%m%d>-%(org-roam-slug-keep-hyphen \"${title}\").org"
               "#+title: ${title}\n#+type: life\n#+source: ${source}\n#+date: %U\n#+last_modified: %U\n")
      :unnarrowed t)
     
     ("p" "programming" plain "%?"
      :target (file+head
               "50-programming/%<%Y%m%d>-%(org-roam-slug-keep-hyphen \"${title}\").org"
               "#+title: ${title}\n#+type: programming\n#+date: %U\n#+last_modified: %U\n")
      :unnarrowed t)
     
     ("r" "reading" plain "%?"
      :target (file+head
               "60-reading/%<%Y%m%d>-%(org-roam-slug-keep-hyphen \"${title}\").org"
               "#+title: ${title}\n#+type: reading\n#+author: ${author}\n#+source: ${source}\n#+date: %U\n#+last_modified: %U\n")
      :unnarrowed t)
     
     ("m" "meta" plain "%?"
      :target (file+head
               "90-meta/%<%Y%m%d>-%(org-roam-slug-keep-hyphen \"${title}\").org"
               "#+title: ${title}\n#+type: meta\n#+date: %U\n#+last_modified: %U\n")
      :unnarrowed t)))
  
  ;; :bind (;; ("C-c n l" . org-roam-buffer-toggle)
  ;;        ;; ("C-c C-f" . org-roam-node-find)
  ;;        ;; ("C-c n i" . org-roam-node-insert)
  ;;        ;; ("C-c n c" . org-roam-capture)
  ;;        :map org-mode-map
  ;;        ;; ("C-c C-f" . org-roam-node-find)
  ;;        ("C-M-i" . completion-at-point))

  :config
  (org-roam-db-autosync-mode))

(use-package helm-roam
  :bind (("C-c C-f" . helm-roam)
         :map org-mode-map
         ("C-c C-f" . helm-roam))
  )

(provide 'init-org-mode)
;;; init-org-mode.el ends here

