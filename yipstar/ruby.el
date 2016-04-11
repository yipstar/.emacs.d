;; rinari
(require 'rinari-autoloads)
(setq rinari-tags-file-name "TAGS")

;; rhtml with nxml
;; (setq auto-mode-alist (cons '("\\.html\\.erb" . nxml-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.erb" . nxml-mode) auto-mode-alist))

;; rhtml with nxhtml
;; (load "nxhtml/autostart.el")
;; (setq
;;  nxhtml-global-minor-mode t
;;  mumamo-chunk-coloring 'submode-colored
;;  nxhtml-skip-welcome t
;;  indent-region-mode t
;;  rng-nxml-auto-validate-flag nil
;;  nxml-degraded t)
;; (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . eruby-nxhtml-mumamo-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . eruby-nxhtml-mumamo-mode))

;; TODO: doesn't work to fix warnings, grrr
;; (eval-after-load 'nxhtml '(nxhtml-toggle-visible-warnings))

(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")
(autoload 'rhtml-mode "rhtml-mode" "RHTML Mode" t)
(add-to-list 'auto-mode-alist '("\\.rhtml$" rhtml-mode))
(add-to-list 'auto-mode-alist '("\\.html.erb$" rhtml-mode))


;; ruby
(setq auto-mode-alist (cons '("Rakefile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("Gemfile" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.rake" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.ru" . ruby-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gemspec" . ruby-mode) auto-mode-alist))

;; rvm
(require 'rvm-autoloads)
(rvm-use-default)

;; yari
(require 'yari-autoloads)

;; (add-to-list 'load-path "~/.emacs.d/vendor/snowyote-ruby-electric-a250b30")
;; (require 'ruby-electric)

;; subword-mode
(add-hook 'ruby-mode-hook (lambda () 
			    (subword-mode t)
			    ;; (ruby-electric-mode t)
                            ))

;; don't insert # -*- coding: utf-8 -*- at top of files!
(setq ruby-insert-encoding-magic-comment nil)
