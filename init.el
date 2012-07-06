;; setup load paths
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/vendor")

;; setup package manager
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . 
               "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; my global customizations
(load "yipstar/global")

(setenv "SHELL" "/bin/bash")
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
