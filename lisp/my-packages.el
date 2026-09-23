;;; my-packages.el --- package archives and sources -*- lexical-binding: t -*-

(require 'package)

(setopt package-archives
        '(("gnu"    . "https://elpa.gnu.org/packages/")
          ("nongnu" . "https://elpa.nongnu.org/nongnu/")
          ("melpa"  . "https://melpa.org/packages/")))

(setopt package-archive-priorities
        '(("gnu"    . 3)
          ("nongnu" . 2)
          ("melpa"  . 1)))

;; GUI Emacs on macOS doesn't inherit the shell environment.
;; PATH entries are invisible to subprocesses.  Guard on the build, not
;; on `window-system', which is nil under `emacs --daemon'.
(use-package exec-path-from-shell
  :ensure t
  :if (featurep 'ns)
  :config (exec-path-from-shell-initialize))

;; vterm builds a native module on first use, so only enable it where
;; this machine can actually compile one.
(when (and module-file-suffix (executable-find "cmake"))
  (use-package vterm
    :ensure t
    :commands vterm))

(provide 'my-packages)
