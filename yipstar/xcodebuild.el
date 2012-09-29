(require 'cl)
;; for common lisp macros, is this necessary?

;; TODO: after going up to root directory, restore cd to previous directory

;; Bugs: set-sdk seems to set sdk for all projects not the current one, why?

;; Goals:
;; Set Current Build Settings options:
;; Active SDK. Done.
;; Active Configuration.
;; Active Target
;; Active Executable
;; Active Architecture

;; TODO: create a function that can take the word under point and bring up xcode 
;; documentation for it.

;; TODO: make xcodebuild-compile smart, set a default build configuration and target but allow to ovveride.
;; TODO: match iphone-simulator-run to how xcode works.

;; store project settings
(defun xcodebuild-compile ()
  (interactive)

  (xcodebuild-set-current-directory-to-project-root)

  (setq xcodebuild-command "xcodebuild")
  
  (if (not (boundp 'xcodebuild-configuration))
      (setq xcodebuild-configuration "Debug"))
  
  (setq xcodebuild-command (format (concat xcodebuild-command " -configuration %s") xcodebuild-configuration))

  (if (xcodebuild-get-sdk-value)
      (setq xcodebuild-command (format (concat xcodebuild-command " -sdk %s") (xcodebuild-get-sdk-value))))

  (compile xcodebuild-command))

  ;;(compile "xcodebuild -configuration Debug -target 'Unit Tests'") ;; unit tests
  

;; TODO: the current keybindings for this command conflict with other bindings when in shell mode,
;; either turn off that conflicting keybinding or maybe come up with a standard prefix for all xcode related tasks.
;; that would probably be best

(defun xcodebuild-run ()
  (interactive)
  (xcodebuild-set-current-directory-to-project-root)
  (if (xcodebuild-is-iphone-project-p)
      (xcodebuild-run-in-iphone-simulator)
    (xcodebuild-run-macosx)
    )
  )

(defun xcodebuild-is-iphone-project-p()
  (file-exists-p "build/Debug-iphonesimulator")
  )

;; TODO: is there a way to wait for compilation to complete before running? this command is kinda useless right now,
;; it starts the compile but executes the old executable right away.
(defun xcodebuild-compile-and-run ()
  (interactive)
  (xcodebuild-compile)
  (xcodebuild-run)
  )

(defun xcodebuild-run-macosx()
  (interactive)
  (shell-command "./build/Debug/*.app/Contents/MacOS/*&" "console")
  )

(defun xcodebuild-run-in-iphone-simulator()
  (interactive)
  (xcodebuild-erase-iphone-simulator-project-directory)
  (xcodebuild-create-iphone-simulator-project-directory)
  (xcodebuild-create-iphone-simulator-project-subdirectories)
  (xcodebuild-copy-iphone-simulator-debug-build-to-iphone-simulator-project-directory)
  (xcodebuild-copy-sb-file)
  ;;  (xcodebuild-show-console)
  (xcodebuild-launch-iphone-simulator)
  )

(defun current-buffer-directory()
  (interactive)
  (substring (pwd) 10)
  )

;; TODO: this should be smarter and look for the ProjectName.xcodeproj file?
(defun xcodebuild-current-directory-at-project-root-p ()
  (interactive)
  (directory-files "." nil ".*\.xcodeproj")
  ;; (file-exists-p "main.m")
  )

(defun xcodebuild-set-current-directory-to-project-root ()
  (interactive)  
  (cd (current-buffer-directory))
  (if (not (xcodebuild-current-directory-at-project-root-p))
      (xcodebuild-recurse-to-project-root-directory (current-buffer-directory)))
  )
  
(defun xcodebuild-recurse-to-project-root-directory (current-directory)
  (interactive)
  (if (not (xcodebuild-current-directory-at-project-root-p))
      (progn
	(setq next-directory (expand-file-name (concat current-directory "../")))
	(cd next-directory)
	(xcodebuild-recurse-to-project-root-directory next-directory)))
  )

(defun xcodebuild-project-name()
  (interactive)
  (xcodebuild-recurse-to-project-root-directory (current-buffer-directory))
  (let ((project-file (car (directory-files "." nil ".*\.xcodeproj"))))
    (car (split-string project-file "\\."))
    )
  )

(defun xcodebuild-erase-iphone-simulator-project-directory()
  (interactive)
  (if (file-exists-p (xcodebuild-iphone-simulator-project-directory))
      (dired-delete-file (xcodebuild-iphone-simulator-project-directory) 'always))
  (if (file-exists-p (concat (xcodebuild-iphone-simulator-project-directory) ".sb"))
      (dired-delete-file (concat (xcodebuild-iphone-simulator-project-directory) ".sb")))
  )

(defun xcodebuild-create-iphone-simulator-project-directory()
  (interactive)
  (dired-create-directory (xcodebuild-iphone-simulator-project-directory))
  )

(defun xcodebuild-create-iphone-simulator-project-subdirectories()
  (interactive)
  (dired-create-directory (concat (xcodebuild-iphone-simulator-project-directory) "/Documents"))
  (dired-create-directory (concat (xcodebuild-iphone-simulator-project-directory) "/Library"))
  (dired-create-directory (concat (xcodebuild-iphone-simulator-project-directory) "/Library/Preferences"))
  (dired-create-directory (concat (xcodebuild-iphone-simulator-project-directory) "/tmp"))
  )

(defun xcodebuild-copy-iphone-simulator-debug-build-to-iphone-simulator-project-directory()
  (interactive)
  (xcodebuild-recurse-to-project-root-directory ".")
  (let ((cmd (concat (concat "cp -Rf " (concat (concat "build/Debug-iphonesimulator/" (xcodebuild-project-name)) ".app ")) 
		     (concat (xcodebuild-iphone-simulator-project-directory-spaces-escaped) "/"))))
    (shell-command cmd)
    )
  )

(defun xcodebuild-iphone-simulator-project-directory()
  (interactive)
  (concat (expand-file-name "~/Library/Application Support/iPhone Simulator/User/Applications/") (xcodebuild-project-name))
  )

(defun xcodebuild-iphone-simulator-project-directory-spaces-escaped()
  (interactive)
  (concat (expand-file-name "~/Library/Application\\ Support/iPhone\\ Simulator/User/Applications/") (xcodebuild-project-name))
  )

(defun xcodebuild-launch-iphone-simulator()
  (shell-command "/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\\ Simulator.app/Contents/MacOS/iPhone\\ Simulator&" "iphone-simulator"))

(define-skeleton xcodebuild-sb-file-contents
  "iPhone Simulator sb file"
  "\n"
  "(version 1)\n"
  "(debug deny)\n"
  "(allow default)\n"
  )

(defun xcodebuild-copy-sb-file()
 (interactive)
 (let ((oldbuf (current-buffer)))
   (save-current-buffer
     (set-buffer (find-file (concat (concat (concat (xcodebuild-iphone-simulator-project-directory) ".sb")))))
     (xcodebuild-sb-file-contents)
     (basic-save-buffer)
     (kill-buffer nil)))
 )

;; current project-setting alist for current project
(defun xcodebuild-get-project-settings ()
  (interactive)

  (if (not (boundp 'xcodebuild-projects-alist))
      (xcodebuild-load-projects-alist))

  (if (not (xcodebuild-project-settings-p))
      (push (xcodebuild-make-project-settings-element) xcodebuild-projects-alist))      

  (cdr (assoc (xcodebuild-project-name) xcodebuild-projects-alist)))

;; load settings from project file eventually
(defun xcodebuild-load-projects-alist ()
  (interactive)
  ;;(xcodebuild-set-current-directory-to-project-root)

  ;; if file for project exists load it.  
  (setq xcodebuild-projects-alist ()))
  

(defun xcodebuild-project-settings-p ()
  (interactive)
  (assoc (xcodebuild-project-name) xcodebuild-projects-alist))

(defun xcodebuild-make-project-settings-element ()
  (interactive)
  (cons (xcodebuild-project-name) (xcodebuild-project-settings-element)))

(defun xcodebuild-project-settings-element ()
  (list (cons :sdk "iphone") (cons :target "debug")))

(defun xcodebuild-set-sdk ()
  (interactive)
  (let ((new-sdk (completing-read 
		  "SDK: "
		  (xcodebuild-sdk-keys))))
    (setcdr (assoc :sdk (xcodebuild-get-project-settings)) new-sdk)))

(defun xcodebuild-sdk-keys ()
  (interactive)
  (if (not (boundp 'xcodebuild-sdks-alist))
      (xcodebuild-load-sdks-alist))
  (mapcar 'car xcodebuild-sdks-alist))

(defun xcodebuild-load-sdks-alist ()
  (interactive)
  (xcodebuild-set-current-directory-to-project-root)
  (setq xcodebuild-sdks-alist nil)
  (let ((sdk-lines (split-string (shell-command-to-string "xcodebuild -showsdks") "\n")))
    (dolist (line sdk-lines)
      (if (and (not (equal line ""))
	       (not (string-match "SDKs:" line)))
	  (let ((sdk-tabs (split-string line "\t")))
	    (push `(,(xcodebuild-string-trim (nth 1 sdk-tabs)) . ,(nth 1 (split-string (nth 2 sdk-tabs) "-sdk "))) xcodebuild-sdks-alist))))))

;; shouldn't this be in emacs by default somewhere?
(defun xcodebuild-string-trim (string)
  (replace-regexp-in-string "\\(^[ \t]*\\|[ \t]*$\\)" "" string))

(defun xcodebuild-list-targets ()
  (interactive)
  (xcodebuild-set-current-directory-to-project-root)
  (let ((result (shell-command-to-string "xcodebuild -list")))
    (message result)))

(defun xcodebuild-get-sdk-value ()
  (interactive)
  (if (not (boundp 'xcodebuild-sdks-alist))
      (xcodebuild-load-sdks-alist))
  (cdr (assoc (xcodebuild-get-sdk) xcodebuild-sdks-alist)))

(defun xcodebuild-get-sdk ()
  (interactive)
  (xcodebuild-get-project-setting-for-key :sdk))

(defun xcodebuild-get-project-setting-for-key (key)
  (interactive)
  (cdr (assoc key (xcodebuild-get-project-settings))))

(defun xcodebuild-show-console ()
  (interactive)
  (shell-command (concat (concat "tail -f /var/log/system.log | grep " (xcodebuild-project-name)) "&") "console"))

;; TODO: fix this, the rm command is not actually working, see the erase command above.
(defun xcodebuild-clear-iphone-simulator-applications-directory()
  (interactive)
  (shell-command (concat "rm -rf " (expand-file-name "~/Library/Application Support/iPhone Simulator/User/Applications/*"))))

