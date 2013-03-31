;; Setup meta, alt, and ctrl
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))
(setq ns-control-modifier (quote control))

;; Get rid of the Toolbar, the Menubar, and the Scrollbar.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

;; Turn off annoying beep
(setq ring-bell-function 'ignore)

;; Turn off visible blinking
(setq visible-bell nil)

;; What does this do?
(setq line-move-visual nil)

;; Turn on syntax highlighting everywhere available
(global-font-lock-mode 1)

;; Turn on Transient Mark Mode
(transient-mark-mode 1)

;; Use Inconsolata as my default font
(setq yipstar-default-font "Inconsolata")

;; Turn off line wrapping of long lines
(setq-default truncate-lines 1)

;; Keep temp files and auto save files out of my way
;; http://amitp.blogspot.com/2007/03/emacs-move-autosave-and-backup-files.htmlri
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Turn off auto-save. I hate #foo# files
(setq auto-save-default nil)

;; Turn off nxhtml-warnings until I figure out how to disable warnings from
;; being visible.
(eval-after-load 'nxhtml '(nxhtml-toggle-visible-warnings))
