;;; my-langs.el --- languages and terminals -*- lexical-binding: t -*-

;; Markdown
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode))

;; Org source blocks: keep whitespace exactly as typed.
(setopt org-src-preserve-indentation t)
(setopt org-edit-src-content-indentation 0)

(provide 'my-langs)
