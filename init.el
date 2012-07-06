;; Get rid of the Toolbar, the Menubar, and the Scrollbar.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;;(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

(setenv "SHELL" "/bin/bash")
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . 
               "http://marmalade-repo.org/packages/") t)
(package-initialize)
