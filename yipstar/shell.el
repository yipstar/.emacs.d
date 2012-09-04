;; TODO: keeping a duplicate PATH for emacs sucks, why isn't the plist fix working?
;; http://olabini.com/blog/2009/12/path-problem-with-emacs-on-mac-os-x/

(setenv "PATH" (concat (getenv "HOME") "/.rbenv/shims:" (getenv "HOME") "/.rbenv/bin:" (getenv "PATH")))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (cons (concat (getenv "HOME") "/.rbenv/shims") (cons (concat (getenv "HOME") "/.rbenv/bin") exec-path)))

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region (point-min) (point-max))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(setq ansi-color-for-comint-mode t)
(add-hook 'minibuffer-setup-hook 'colorize-compilation-buffer)
