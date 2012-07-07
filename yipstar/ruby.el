;; rinari
(require 'rinari-autoloads)
(setq rinari-tags-file-name "TAGS")

;; rhtml with nxml
;; (setq auto-mode-alist (cons '("\\.html\\.erb" . nxml-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.erb" . nxml-mode) auto-mode-alist))

;; rhtml with nxhtml
(load "nxhtml/autostart.el")
(setq
 nxhtml-global-minor-mode t
 mumamo-chunk-coloring 'submode-colored
 nxhtml-skip-welcome t
 indent-region-mode t
 rng-nxml-auto-validate-flag nil
 nxml-degraded t)
(add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . eruby-nxhtml-mumamo-mode))

;; ruby
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ru" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec" . ruby-mode) auto-mode-alist))

