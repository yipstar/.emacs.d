;; Enable keybindings for moving through windows with ctrl-->
(windmove-default-keybindings)

;; Turn on winner-mode, C-c left and C-c right to switch through window configurations
(winner-mode 1)

;; use switch-window to take over C-x o and use numbers to choose the buffer
(require 'switch-window-autoloads)
(require 'switch-window)

;; e2wm
(require 'window-layout-autoloads)
(require 'e2wm-autoloads)
(require 'e2wm)
