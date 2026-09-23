;;; my-files.el --- where Emacs writes its own files -*- lexical-binding: t -*-

(defconst my/var-directory
  (locate-user-emacs-file "var/")
  "Directory for files Emacs writes on its own.")

(defconst my/backup-directory
  (expand-file-name "backup/" my/var-directory)
  "Directory for backup files, normally named `init.el~'.")

(defconst my/auto-save-directory
  (expand-file-name "auto-save/" my/var-directory)
  "Directory for auto-save files, normally named `#init.el#'.")

(defconst my/lock-directory
  (expand-file-name "lock/" my/var-directory)
  "Directory for lock files, normally named `.#init.el'.")

(defconst my/auto-save-list-prefix
  (expand-file-name "auto-save-list/.saves-" my/var-directory)
  "Path prefix for the per-session list of auto-saved files.")

;; Emacs creates none of these itself, so make them up front.
(make-directory my/backup-directory t)
(make-directory my/auto-save-directory t)
(make-directory my/lock-directory t)

;; Where each kind of file goes.
(setopt backup-directory-alist
        (list (cons "." my/backup-directory)))

(setopt auto-save-file-name-transforms
        (list (list ".*" my/auto-save-directory t)))

(setopt lock-file-name-transforms
        (list (list ".*" my/lock-directory t)))

(setopt auto-save-list-file-prefix my/auto-save-list-prefix)

;; How backups behave.
(setopt backup-by-copying t)    ; copy the file, never move the original
(setopt version-control t)      ; numbered backups: init.el.~1~, init.el.~2~
(setopt delete-old-versions t)  ; prune surplus ones without asking
(setopt kept-new-versions 6)    ; keep the 6 newest
(setopt kept-old-versions 2)    ; keep the 2 oldest

;; Package state that otherwise lands directly in the config directory.
;; These are defcustoms in libraries not loaded yet, so the values are
;; picked up whenever tramp or url first loads.
(setopt tramp-persistency-file-name
        (expand-file-name "tramp" my/var-directory))

(setopt url-configuration-directory
        (expand-file-name "url/" my/var-directory))

;; Customize's own file stays at the top level, not under var/
(setopt custom-file (locate-user-emacs-file "custom.el"))

(provide 'my-files)
