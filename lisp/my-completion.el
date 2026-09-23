;;; my-completion.el --- completion UI -*- lexical-binding: t -*-

;; Vertical, filterable minibuffer -- the "command palette" feel.
(use-package vertico
  :ensure t
  :init
  (vertico-mode 1))

;; Match space-separated fragments in any order: "co mo" finds
;; `completion-preview-mode'.
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

;; Describe candidates in the margin: key bindings, docstrings, file sizes.
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))

;; Popup completion at point, the way an IDE does it.
(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)          ; pop up without being asked
  (corfu-auto-delay 0.2)  ; ...after this long
  (corfu-auto-prefix 2)   ; ...and this many characters
  (corfu-cycle t)         ; wrap around at the end of the list
  :init
  (global-corfu-mode 1))

;; TAB indents first; completes only when the line is already indented.
(setopt tab-always-indent 'complete)

(provide 'my-completion)
