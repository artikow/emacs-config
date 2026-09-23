;;; init.el --- personal configuration -*- lexical-binding: t -*-

(add-to-list 'load-path (locate-user-emacs-file "lisp/"))

(require 'my-packages)   ; archives, use-package, shell environment
(require 'my-files)      ; backups, auto-saves, lock files, custom-file
(require 'my-ui)         ; theme, startup screen, window navigation
(require 'my-completion) ; minibuffer and at-point completion
(require 'my-editing)    ; auto-revert, whitespace, line numbers, indentation
(require 'my-langs)      ; markdown
(require 'my-c)          ; C and C++

;; Loaded last on purpose: it enables the theme installed by `my-ui',
;; and its settings should override everything above.
(load custom-file t t)

;;; init.el ends here
