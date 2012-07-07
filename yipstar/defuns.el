;; Create an emacs TAGS file, requires the project root
;; http://www.emacswiki.org/emacs/BuildTags

(setq yipstar-path-to-ctags "/opt/local/bin/ctags")
(defun yipstar-create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "%s -f %s/TAGS -e -R %s" yipstar-path-to-ctags dir-name (directory-file-name dir-name)))
  )
