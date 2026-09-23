;;; my-c.el --- C and C++ -*- lexical-binding: t -*-

;; Both languages share cc-mode, so they share this file.

;; cc-mode's own "k&r" style indents by 5 columns; derive a 4-column
;; variant.  Registering it after cc-styles loads keeps cc-mode out of
;; startup.
(with-eval-after-load 'cc-styles
  (c-add-style "k&r-4" '("k&r" (c-basic-offset . 4))))

(setopt c-default-style
        '((java-mode . "java")
          (awk-mode  . "awk")
          (other     . "k&r-4")))

;; Start clangd on open.  Eglot already knows to use clangd for these
;; modes, so nothing else needs configuring on the Emacs side; clangd
;; itself reads compile_flags.txt or compile_commands.json.
(add-hook 'c-mode-hook   #'eglot-ensure)
(add-hook 'c++-mode-hook #'eglot-ensure)

(provide 'my-c)
