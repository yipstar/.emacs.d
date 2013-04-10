(global-set-key "\M-g" 'goto-line)

(global-set-key "\C-c\i" 'yipstar-indent-buffer)

(global-set-key "\C-xg" 'magit-status)

(global-set-key "\C-t" 'ys-run-test)

(global-set-key "\C-t" 'xcodebuild-compile)

(global-set-key "\C-xp" 'objc-headline)

;;(global-set-key "\C-t" 'ys-run-rake)

;; save my right pinky by making deleting easier
;; http://www.emacswiki.org/emacs/BackspaceKey
(global-set-key "\C-?" 'help-command)
(global-set-key "\M-?" 'mark-paragraph)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)

(global-set-key (kbd "C-c k") 'ys-kill-other-buffers)

(global-set-key (kbd "C-c c") 'compile)

; c-mode and derivatives

;; (add-hook 'c-mode-common-hook
;;   (lambda() 
;;     (local-set-key  (kbd "C-c t") 'objc-jump-between-header-source)))

(define-key objc-mode-map (kbd "C-c t") 'ys-objc-jump-between-header-source)

;; http://www.jimmenard.com/emacs_tips.html
(define-key global-map [f9] 'bookmark-jump)
(define-key global-map [f10] 'bookmark-set)
