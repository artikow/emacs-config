;;; my-langs.el --- languages and terminals -*- lexical-binding: t -*-

;; Markdown
(use-package markdown-mode
  :ensure t
  :mode ("\\.md\\'" . gfm-mode))

(provide 'my-langs)
