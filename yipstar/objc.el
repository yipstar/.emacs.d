;; use subword-mode
(add-hook 'objc-mode-hook (lambda () (subword-mode t)))

;; useful customizations: http://www.emacswiki.org/emacs/ObjectiveCMode

;; when opening .h files check for @interface and if present open in objc-mode
(add-to-list 'magic-mode-alist
             `(,(lambda ()
                  (and (string= (file-name-extension buffer-file-name) "h")
                       (re-search-forward "@\\<interface\\>" 
                                          magic-mode-regexp-match-limit t)))
               . objc-mode))

;; http://roupam.github.com/
;; toggle between .h and .m files

(defun ys-objc-in-header-file ()
  (let* ((filename (buffer-file-name))
         (extension (car (last (split-string filename "\\.")))))
    (string= "h" extension)))

(defun ys-objc-jump-to-extension (extension)
  (let* ((filename (buffer-file-name))
         (file-components (append (butlast (split-string filename
                                                         "\\."))
                                  (list extension))))
    (find-file (mapconcat 'identity file-components "."))))

;;; Assumes that Header and Source file are in same directory
(defun ys-objc-jump-between-header-source ()
  (interactive)
  (if (ys-objc-in-header-file)
      (ys-objc-jump-to-extension "m")
    (ys-objc-jump-to-extension "h")))

;; osx/xcode c++ files
(add-to-list 'auto-mode-alist '("\\.mm\\'" . c++-mode))

(defun ys-objc-mode-hook ()
  (setq c-basic-offset 4))
(add-hook 'objc-mode-hook 'ys-objc-mode-hook)


(defun ys-c++-mode-hook ()
  (setq c-basic-offset 4))
(add-hook 'c++-mode-hook 'ys-c++-mode-hook)

;; anything config for pragma support
(require 'anything)
(require 'anything-config)

(defvar anything-c-source-objc-headline
  '((name . "Objective-C Headline")
    (headline  "^[-+@]\\|^#pragma mark")))

(defun objc-headline ()
  (interactive)
  ;; Set to 500 so it is displayed even if all methods are not narrowed down.
  (let ((anything-candidate-number-limit 500))
    (anything-other-buffer '(anything-c-source-objc-headline)
                           "*ObjC Headline*")))


(load "yipstar/xcodebuild")

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/senny-emacs-xcode/"))
;; (require 'xcode)

;; (require 'w3m-autoloads)
;; (require 'w3m)
;; (require 'xcode-document-viewer)
;; (setq xcdoc:document-path "/Users/rpg/Library/Developer/Shared/Documentation/DocSets/com.apple.adc.documentation.AppleiOS5_1.iOSLibrary.docset")
;; (setq xcdoc:open-w3m-other-buffer t)
