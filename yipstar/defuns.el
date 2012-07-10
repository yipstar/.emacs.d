;; Create an emacs TAGS file, requires the project root
;; http://www.emacswiki.org/emacs/BuildTags

(setq yipstar-path-to-ctags "/opt/local/bin/ctags")
(defun yipstar-create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" yipstar-path-to-ctags dir-name (directory-file-name dir-name)))
  )

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
