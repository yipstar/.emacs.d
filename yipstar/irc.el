(require 'erc)

;; TODO: add caboose with password kept out of git

;; autojoin these channels
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#nyc.rb"
	  "#rubinius" "#emberjs" "#clojure" "#elixir-lang")
	))

;; my erc-connect macro
(defun my-irc ()
   "connect to freenode.net, using erc"
   (interactive)
   (erc-select :server "chat.freenode.net" :port 6667 :nick "yipstar")
   )

;; my erc-connect macro
(defun my-tunneled-irc ()
   "connect to freenode.net, using erc"
   (interactive)
   (erc-select :server "localhost" :port 6667 :nick "yipstar")
   )
