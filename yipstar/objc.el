;; use subword-mode
(add-hook 'objc-mode-hook (lambda () (subword-mode t)))

;; when opening .h files check for @interface and if present open in objc-mode
(add-to-list 'magic-mode-alist
             `(,(lambda ()
                  (and (string= (file-name-extension buffer-file-name) "h")
                       (re-search-forward "@\\<interface\\>" 
                                          magic-mode-regexp-match-limit t)))
               . objc-mode))

;; make ff-find-other-file to work with .m and .mm files
(require 'find-file) ;; for the "cc-other-file-alist" variable
(nconc (cadr (assoc "\\.h\\'" cc-other-file-alist)) '(".m" ".mm"))

;; osx/xcode c++ files
(add-to-list 'auto-mode-alist '("\\.mm\\'" . c++-mode))
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(load "yipstar/xcodebuild")

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/senny-emacs-xcode/"))
;; (require 'xcode)


