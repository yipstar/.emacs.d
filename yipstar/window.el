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

;; Some common window split configs.
(defun 4-equal-window-view ()
  "split current-frame into four equally sized windows"
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically))

(defun 3by2-window-view ()
  "split current-frame into 2 by 3 equally sized windows"
  (interactive)
  (delete-other-windows)
  (setq window_width (/ (frame-width) 3))
  (message "setting window width to %s" window_width)
  (split-window-horizontally window_width)
  (other-window 1)
  (split-window-horizontally window_width)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically))

(defun 3by2mod4-window-view ()
  "split current-frame into 8 windows (irc setup)"
  (interactive)
  (3by2-window-view)
  (other-window 4)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically))
