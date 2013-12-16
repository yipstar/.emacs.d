;; This keeps my PATH from bash working :)
(exec-path-from-shell-initialize)

;; (require 'ansi-color)

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

;; (setq ansi-color-for-comint-mode t)

(add-hook 'minibuffer-setup-hook 'colorize-compilation-buffer)


