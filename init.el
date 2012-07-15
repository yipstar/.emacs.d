;; setup load paths
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; configure package.el and bundle install packages I use
(load "yipstar/packages")

;; custom place to save customizations
(setq custom-file "~/.emacs.d/yipstar/custom.el")
(when (file-exists-p custom-file) (load custom-file))

;; my global customizations
(load "yipstar/global")

;; disable annoying prompts
(load "yipstar/prompt")

;; custom functions
(load "yipstar/defuns")

;; aliases
(load "yipstar/aliases")

;; color theme
(load "yipstar/theme")

;; modes
(load "yipstar/modes")

;; window management
(load "yipstar/window")

;; bindings
(load "yipstar/bindings")

(setenv "SHELL" "/bin/bash")
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; maximize the frame on startup
(add-hook 'window-setup-hook 'maximize-frame t)
