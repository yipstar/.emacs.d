;; Create an emacs TAGS file, requires the project root
;; http://www.emacswiki.org/emacs/BuildTags

(setq yipstar-path-to-ctags "/usr/local/bin/ctags")
(defun yipstar-create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" yipstar-path-to-ctags dir-name (directory-file-name dir-name)))
  )

;; TODO: make a standard rails project ctags command, the above tags every directory
;; /opt/local/bin/ctags -f TAGS -e -R app config jobs/ lib/ spec/ test/ vendor/

;; for setting fonts on a mac.
;; TODO: the interactive pathway is broken, fix it.
(defun yipstar-set-mac-font (name size)
  (interactive
   (list (completing-read "font-name: "
                          (mapcar (lambda (p) (list (car p) (car p)))
                                  (font-family-list)) nil t)
         (read-number "size: " 12)))
  (set-face-attribute 'default nil
                      :family name
                      :slant  'normal
                      :weight 'normal
                      :width  'normal
                      :height (* 10 size))
  (frame-parameter nil 'font))

(defun yipstar-indent-buffer ()
  "Indent the entire buffer"
  (interactive
   (indent-region (point-min) (point-max))))

(defun ys-align-to-equals (begin end)
  "Align region to equal signs"
  (interactive "r")
  (align-regexp begin end "\\(\\s-*\\)=" 1 1 ))

(defvar ys-run-test-command)
(setq ys-run-test-command "ruby")

(defvar ys-run-test-file)
(setq ys-run-test-file "portfolio.rb")
(setq compile-command (concat "ruby -I test " ys-run-test-file))

;; TODO: refactor test stuff to be language agnostic and work with lein test
(defun ys-run-test ()
  (interactive)
  (cd (textmate-project-root))
  ;; (setq compile-command (concat ys-run-test-command (concat " -I test " ys-run-test-file)))
  (setq compile-command ys-run-test-command)
  (compile compile-command)
  )


(defun ys-run-rake ()
  (interactive)
  (cd (textmate-project-root))
  (setq compile-command "rake test:lockdown")
  (compile compile-command)
  )

(defvar ys-run-deploy-command)
(setq ys-run-deploy-command "./script/deploy.sh")

(defun ys-run-deploy ()
  (interactive)
  (cd (textmate-project-root))
  (compile ys-run-deploy-command)
  )

(defun ys-kill-other-buffers ()
  "Kill all buffers but the current one.
Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))
