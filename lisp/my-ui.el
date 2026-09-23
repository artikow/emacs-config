;;; my-ui.el --- appearance and window handling -*- lexical-binding: t -*-

;; The theme itself is enabled by `custom-enabled-themes' in custom.el,
;; so the package has to be installed before that file is loaded.
(use-package gruvbox-theme
  :ensure t)

;; Disable the startup splash screen.
(setopt inhibit-startup-screen t)

;; Enable S-<arrow> shortcuts to switch between windows.
(windmove-default-keybindings)

(provide 'my-ui)
