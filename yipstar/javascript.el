(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js" . js2-mode))

(add-hook 'js2-mode-hook (lambda () (subword-mode t)))

(setq-default indent-tabs-mode nil)
