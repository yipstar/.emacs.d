;; use paredit for clojure code
(add-hook 'clojure-mode-hook 'paredit-mode)

;; cider config

;; ;; use eldoc
;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

;; ;; hide nrepl buffers from switching commands
;; (setq nrepl-hide-special-buffers t)

;; ;; Prevent the auto-display of the REPL buffer 
;; ;; in a separate window after connection is established
;; (setq cider-repl-pop-to-buffer-on-connect nil)

;; ;; Stop the error buffer from popping up while working in 
;; ;; buffers other than the REPL
;; (setq cider-popup-stacktraces nil)

;; ;; Enable error buffer popping also in the REPL
;; (setq cider-repl-popup-stacktraces t)

;; ;; To auto-select the error buffer when it's displayed
;; (setq cider-auto-select-error-buffer t)

;; ;; Make C-c C-z switch to the CIDER REPL buffer in the current window
;; (setq cider-repl-display-in-current-window t)

;; ;; Make the REPL history wrap around when its end is reached
;; (setq cider-repl-wrap-history t)

;; ;; adjust the maximum number of items kept in the REPL history
;; (setq cider-repl-history-size 1000) ; the default is 500

;; ;; enable camelcase editing in repl
;; (add-hook 'cider-repl-mode-hook 'subword-mode)

;; ;; use paredit in repl
;; (add-hook 'cider-repl-mode-hook 'paredit-mode)

;; ;; use rainbow delimiters in repl
;; (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)

