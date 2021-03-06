;; TODO: if package fails because of signing issues use:
;; (setq package-check-signature nil)
;; figure out why?

;; setup package manager
(require 'package)

;; only use the gnu elpa archive, comment out marmalade and melpa

;; (add-to-list 'package-archives
;;              '("marmalade" . 
;;                "http://marmalade-repo.org/packages/") t)

;; (add-to-list 'package-archives
;;              '("melpa" . 
;;                "http://melpa.milkbox.net/packages/") t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;; (add-to-list 'package-archives
;;              '("melpa-stable" . 
;;                "http://stable.melpa.org/packages/") t)

(package-initialize)

;; programatically bundle packages, taken from: https://github.com/bbatsov/prelude
(require 'cl)

;; (defvar yipstar-packages
;;   '(ack-and-a-half expand-region gist guru-mode helm helm-projectile magit magithub melpa
;;                    rainbow-mode volatile-highlights yasnippet zenburn-theme)
;;   "A list of packages to ensure are installed at launch.")

;; clojure-test-mode

(defvar yipstar-packages
  '(ack-and-a-half rinari switch-window scss-mode js2-mode window-layout e2wm
		   maxframe rvm yari textmate flymake-cursor flymake-ruby flymake-jslint 
		   twittering-mode yaml-mode magit csv-mode github-theme solarized-theme color-theme-sanityinc-tomorrow
                   ess exec-path-from-shell w3m anything anything-config 
                   clojure-mode dash paredit cider
		   php-mode swift-mode handlebars-mode ace-jump-mode
                   clojure-mode-extra-font-locking ido-ubiquitous smex projectile
                   rainbow-delimiters git-timemachine
                   solarized-theme moe-theme twilight-theme zenburn-theme monokai-theme leuven-theme
                   elixir-mode alchemist
                   ))

;; tried but disable packages:
;; highlight-80+

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



