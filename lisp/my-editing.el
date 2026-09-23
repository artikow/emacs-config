;;; my-editing.el --- buffer and editing behaviour -*- lexical-binding: t -*-

;; Automatically revert buffers when the underlying file changes on disk.
(setopt global-auto-revert-non-file-buffers t
        auto-revert-verbose nil
        auto-revert-avoid-polling t)
(global-auto-revert-mode 1)

;; Which kinds of whitespace to visualize.
(defconst my/whitespace-style
  '(empty                   ; empty lines at start/end of buffer
    face                    ; master switch: the other face entries need it
    indentation             ; SPACEs at BOL (or TABs, per `indent-tabs-mode')
    lines-tail              ; the part of a line past `whitespace-line-column'
    missing-newline-at-eof  ; no final newline
    newline                 ; newline characters
    newline-mark            ; glyph substitution for newlines
    page-delimiters         ; ^L page breaks, drawn as a horizontal rule
    space-after-tab         ; `tab-width' or more SPACEs after a TAB
    space-before-tab        ; SPACEs before a TAB
    space-mark              ; glyph substitution for SPACEs and hard spaces
    spaces                  ; SPACEs and hard spaces
    tab-mark                ; glyph substitution for TABs
    tabs                    ; TABs anywhere
    trailing)               ; blanks at end of line
  "Kinds of whitespace to visualize.  See `whitespace-style'.")
(setopt whitespace-style my/whitespace-style)

;; What `lines-tail' above measures against.
(setopt whitespace-line-column 80)

;; Glyphs drawn in place of whitespace characters.
(defconst my/whitespace-display-mappings
  '(;; (space-mark   ?\s   [?·])     ; every SPACE as a middle dot
    (space-mark   ?\xA0   [?¤])      ; no-break space
    (space-mark   ?\u200B [?∅])      ; zero-width space, otherwise invisible
    (space-mark   ?\u202F [?¤])      ; narrow no-break space
    (space-mark   ?\u3000 [?□])      ; ideographic space
    (newline-mark ?\n     [?⏎ ?\n])  ; newline
    (tab-mark     ?\t     [?» ?\t])) ; TAB
  "Glyphs substituted for whitespace characters.")
(setopt whitespace-display-mappings my/whitespace-display-mappings)

(defconst my/whitespace-hooks
  '(prog-mode-hook   ; code
    conf-mode-hook)  ; ini, toml, npmrc, properties, desktop files
  "Mode hooks that should visualize whitespace.")

(dolist (hook my/whitespace-hooks)
  (add-hook hook #'whitespace-mode))

;; Strip trailing whitespace on save.  Code buffers only: in markdown
;; two trailing spaces are a hard line break, so this must never be
;; global.
(add-hook 'prog-mode-hook #'delete-trailing-whitespace-mode)

;; Config line numbers
(setopt display-line-numbers-type t
        display-line-numbers-width 4)

;; Line numbers where I type, not where Emacs talks back.
(defconst my/line-numbers-hooks
  '(prog-mode-hook   ; code, including *scratch*
    text-mode-hook   ; prose, markdown, VC commit buffers
    conf-mode-hook)  ; ini/toml/conf, derived from neither of the above
  "Mode hooks that should display line numbers.")

(dolist (hook my/line-numbers-hooks)
  (add-hook hook #'display-line-numbers-mode))

;; Indentation: spaces, four columns.  Modes that require literal tabs
;; (makefile-mode, the Linux C style) set `indent-tabs-mode' themselves.
(setq-default indent-tabs-mode nil
              tab-width 4)

;; A project's .editorconfig overrides all of the above.
(editorconfig-mode 1)

(provide 'my-editing)
