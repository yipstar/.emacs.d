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

;; maxframe
(require 'maxframe-autoloads)

;; Some common window split configs.
(defun 4-equal-window-view ()
  "split current-frame into four equally sized windows"
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically))

(global-set-key "\C-c\C-f" '4-equal-window-view)

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

(global-set-key "\C-c\C-s" '3by2-window-view)

(defun 3by2mod4-window-view ()
  "split current-frame into 8 windows (irc setup)"
  (interactive)
  (3by2-window-view)
  (other-window 4)
  (split-window-vertically)
  (other-window 2)
  (split-window-vertically))

(global-set-key "\C-c\C-i" '3by2mod4-window-view)

;; Goto previous window
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))

;; Rip off Gary Bernhardts dedicated special window
; GRB: open temporary buffers in a dedicated window split
;; (setq special-display-regexps
;;         '("^\\*Completions\\*$"
;;           "^\\*Help\\*$"
;;           "^\\*grep\\*$"
;;           "^\\*Apropos\\*$"
;;           "^\\*elisp macroexpansion\\*$"
;;           "^\\*local variables\\*$"
;;           "^\\*Compile-Log\\*$"
;;           "^\\*Quail Completions\\*$"
;;           "^\\*Occur\\*$"
;;           "^\\*frequencies\\*$"
;;           "^\\*compilation\\*$"
;;           "^\\*Locate\\*$"
;;           "^\\*Colors\\*$"
;;           "^\\*tumme-display-image\\*$"
;;           "^\\*SLIME Description\\*$"
;;           "^\\*.* output\\*$"           ; tex compilation buffer
;;           "^\\*TeX Help\\*$"
;;           "^\\*Shell Command Output\\*$"
;;           "^\\*Async Shell Command\\*$"
;;           "^\\*Backtrace\\*$"))

;; (setq grb-temporary-window (nth 4 (window-list)))

;; (defun grb-special-display (buffer &optional data)
;;   (let ((window grb-temporary-window))
;;     (with-selected-window window
;;       (switch-to-buffer buffer)
;;       window)))

;; (setq special-display-function #'grb-special-display)

;; (window-list)
