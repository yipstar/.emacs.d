;; ido
(ido-mode t)

(load "yipstar/ruby")
(load "yipstar/javascript")

;; scss
(require 'scss-mode-autoloads)

;; textmate
(require 'textmate-autoloads)
(textmate-mode)

;; flymake
(load "yipstar/flymake")

;; twittering
;; TODO: turn on auto word wrap in twittering-mode
(require 'twittering-mode-autoloads)

;; electrir-pair-mode for completing quotes, etc
(electric-pair-mode t)

;; objc-mode
(add-hook 'objc-mode-hook (lambda () (subword-mode t)))

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/senny-emacs-xcode/"))
;; (require 'xcode)

(load "yipstar/xcodebuild")

;; yaml-mode
(require 'yaml-mode-autoloads)

;; magit
(require 'magit-autoloads)

;; csv
(require 'csv-mode-autoloads)
;; (autoload 'csv-mode "csv-mode"
;;   "Major mode for editing comma-separated value files." t)
;; (require 'csv-mode)
