;; This file is only for windows 7/8/8.1
;; The only thing it does is to set the HOME directories for emacs,
;; then trigger the init.el in the directory specified by HOME to
;; accomplish the true initialization
;; You should put this file in the **default** HOME directory right after
;; emacs is installed

;; recommend: put this in $appdata/roaming/.emacs.d/

;; you can change this dir to the place you like
;; !! remeber NOT TO add slash in the end
(setenv "HOME" "path_to_home")

(load "~/.emacs.d/init.el")


