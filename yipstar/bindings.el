(global-set-key "\M-g" 'goto-line)

(global-set-key "\C-c\i" 'yipstar-indent-buffer)

(global-set-key "\C-xg" 'magit-status)

(global-set-key "\C-t" 'ys-run-test)
;;(global-set-key "\C-t" 'ys-run-rake)

;; save my right pinky by making deleting easier
;; http://www.emacswiki.org/emacs/BackspaceKey
(global-set-key "\C-?" 'help-command)
(global-set-key "\M-?" 'mark-paragraph)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)
