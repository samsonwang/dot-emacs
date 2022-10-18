;;; idle-require.el --- load elisp libraries while Emacs is idle
;;
;; Copyright (C) 2007-2008 Nikolaj Schumacher
;;
;; Author: Nikolaj Schumacher <bugs * nschum de>
;; Version: 1.0
;; Keywords: internal
;; URL: http://nschum.de/src/emacs/idle-require/
;; Compatibility: GNU Emacs 21.x, GNU Emacs 22.x
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
;;
;;; Commentary:
;;
;; Add the following to your .emacs file:
;; (require 'idle-require)
;; (setq idle-require-symbols '(cedet nxml-mode)) ;; <- Specify packages here.
;; (idle-require 'cedet) ;; <- Or like this.
;; (idle-require-mode 1) ;; starts loading
;;
;; As soon as Emacs goes idle for `idle-require-idle-delay' seconds,
;; `idle-require-mode' will start loading the files, symbols or functions in
;; `idle-require-symbols'.  If that is nil, all autoload functions will be
;; loaded, one at a time.
;;
;; Use `idle-require-load-break' to give your CPU a break between each load.
;; Otherwise, you might create 100% CPU load on your system.
;;
;;; Change Log:
;;
;;    The order of calls to `idle-require' is now maintained.
;;    Made `idle-require' parameters compatible to `require'.
;;
;; 2008-02-26 (1.0)
;;    Added convenience function `idle-require'.
;;
;; 2007-05-04 (0.9)
;;    Initial release.
;;
;;; Code:

(defgroup idle-require nil
  "A idle-require declaration for faster startup"
  :group 'startup)

(defcustom idle-require-message-verbose t
  "Whether to report about loading and configuration details."
  :type 'boolean
  :group 'idle-require)

(defcustom idle-require-idle-delay 10
  "Idle time in seconds after which autoload functions will be loaded."
  :type 'integer
  :group 'idle-require)

(defcustom idle-require-load-break 1
  "Time in seconds between automatically loaded functions.
   This keeps `idle-require-mode' from using up the CPU capacity."
  :type 'integer
  :group 'idle-require)

(defcustom idle-require-symbols nil
  "Symbols which need to be autoloaded by `idle-require-mode'.
   This list may contain either autoload functions, file names or features."
  :type '(list symbol)
  :group 'idle-require)

;;;###autoload
(defmacro idle-require (feature &optional filename)
  "Add FEATURE to `idle-require-symbols'.
   FILENAME and NOERROR are provided for compatibility to `require'. If FILENAME
   is non-nil, it is added instead of FEATURE."
  `(add-to-list 'idle-require-symbols (or ,feature ,filename) t))

(defconst idle-require-font-lock-keywords
  '(("(\\(idle-require\\)\\_>[ \t']*\\(\\(?:\\sw\\|\\s_\\)+\\)?"
     (1 font-lock-keyword-face)
     (2 font-lock-constant-face nil t))))

(font-lock-add-keywords 'emacs-lisp-mode idle-require-font-lock-keywords)

(defun idle-req-log (msg)
  (if idle-require-message-verbose
      (message msg)))

;; idle timer for idle require
(defvar idle-require-timer nil)

;;;###autoload
(define-minor-mode idle-require-mode
  "Load unloaded autoload functions when Emacs becomes idle.
   If `idle-require-symbols' is a list of files, those will be loaded.
   Otherwise all autoload functions will be loaded.
   Loading all autoload functions can easily triple Emacs' memory footprint."
  :init-value nil :lighter nil :keymap nil
  (if idle-require-mode
      ;; on
      (progn
        (unless (consp idle-require-symbols)
          (idle-req-log "Loading ALL autoload functions")
          (setq idle-require-symbols (idle-require-get-autoload-symbols)))
        (unless idle-require-timer
          (setq idle-require-timer
                (run-with-idle-timer idle-require-idle-delay
                                     t 'idle-require-load-next))))
    ;; off
    (when idle-require-timer
      (cancel-timer idle-require-timer)
      (setq idle-require-timer nil))))

(defvar idle-require-finish-hook nil
  "hook run after idle-require load all symbols")

(defun idle-require-get-autoload-symbols ()
  "Return all symbols that will be autoloaded."
  (let (symbols symbol)
    (mapatoms
     (lambda (symbol)
       (and (functionp symbol)
            (eq (car-safe (symbol-function symbol)) 'autoload)
            (push symbol symbols))))
    symbols))

(defun idle-require-load-next ()
  "Load symbols from `idle-require-symbols.' until input occurs."
  (let (symbol)
    (idle-req-log "Beginning idle-require")
    ;; (idle-req-log (format "idle require symbols: %s" idle-require-symbols))
    (while (and idle-require-symbols
                (not (input-pending-p)))
      (setq symbol (pop idle-require-symbols))
      (condition-case err
          (cond
           ((stringp symbol)
            (idle-req-log (format "idle-require: load1 %s" symbol))
            (load symbol t))
           ((functionp symbol)
            (setq symbol (symbol-function symbol))
            (when (eq (car-safe symbol) 'autoload)
              ;; still not loaded
              (idle-req-log (format "idle-require: load2 %s" (cadr symbol)))
              (load (cadr symbol) t)))
           (t
            (idle-req-log (format "idle-require: require %s" symbol))
            (require symbol)))
        (error (message "idle-require for %s failed" symbol)))
      (sit-for idle-require-load-break)))
  (when (null idle-require-symbols)
    (idle-require-mode 0)
    (run-hooks 'idle-require-finish-hook)
    (idle-req-log "idle-require finished")))

(provide 'idle-require)
;;; idle-require.el ends here
