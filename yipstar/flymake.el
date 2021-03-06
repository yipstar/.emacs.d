;; flymake
(require 'flymake)

(require 'flymake-cursor-autoloads)
(require 'flymake-cursor)

;; ruby
(require 'flymake-ruby-autoloads)
(require 'flymake-ruby)
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

;; jslint
(require 'flymake-jslint-autoloads)
(add-hook 'js-mode-hook 'flymake-jslint-load)
