;; http://www.masteringemacs.org/articles/2010/11/14/disabling-prompts-emacs/

(fset 'yes-or-no-p 'y-or-n-p)

(setq confirm-nonexistent-file-or-buffer nil)

(setq ido-create-new-buffer 'always)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))
