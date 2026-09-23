;;; early-init.el --- pre-GUI setup -*- lexical-binding: t -*-

;; The libgccjit bundled with Emacs.app derives the macOS version from
;; the Darwin kernel version with an outdated formula, producing
;; "-mmacosx-version-min=18.0" on Darwin 27 and breaking native
;; compilation.  Naming the target explicitly bypasses the calculation.
;; Remove once Emacs.app ships a libgccjit that knows about macOS 26+.
(when (and (eq system-type 'darwin)
           (not (getenv "MACOSX_DEPLOYMENT_TARGET")))
  (setenv "MACOSX_DEPLOYMENT_TARGET" "27.0"))

;; Hide the toolbar
(push '(tool-bar-lines . 0) default-frame-alist)

;; Hide the menu bar
(push '(menu-bar-lines . 0) default-frame-alist)

;; Hide the scrollbars
(push '(vertical-scroll-bars . nil) default-frame-alist)

;; Set global font
(push '(font . "Menlo-18") default-frame-alist)

;; Use a bar-style cursor instead of the default block
(push '(cursor-type . bar) default-frame-alist)
