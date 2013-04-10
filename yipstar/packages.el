;; setup package manager
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . 
               "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("melpa" . 
               "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; programatically bundle packages, taken from: https://github.com/bbatsov/prelude
(require 'cl)

;; (defvar yipstar-packages
;;   '(ack-and-a-half expand-region gist guru-mode helm helm-projectile magit magithub melpa
;;                    rainbow-mode volatile-highlights yasnippet zenburn-theme)
;;   "A list of packages to ensure are installed at launch.")

(defvar yipstar-packages
  '(ack-and-a-half twilight-theme zenburn-theme rinari switch-window scss-mode js2-mode window-layout e2wm
		   maxframe rvm yari textmate flymake-cursor flymake-ruby flymake-jslint 
		   twittering-mode yaml-mode magit csv-mode github-theme solarized-theme color-theme-sanityinc-tomorrow
                   ess exec-path-from-shell w3m anything anything-config)
  "A list of packages to ensure are installed at launch.")

(defun yipstar-packages-installed-p ()
  (loop for p in yipstar-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(defun yipstar-install-packages ()
  (unless (yipstar-packages-installed-p)

    ;; check for new packages (package versions)
    (message "%s" "refreshing package database...")
    (package-refresh-contents)
    (message "%s" " done.")

    ;; install the missing packages
    (dolist (p yipstar-packages)
      (unless (package-installed-p p)
        (package-install p)))))

(yipstar-install-packages)



