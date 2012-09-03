require "rubygems"

# http://olabini.com/blog/2009/12/path-problem-with-emacs-on-mac-os-x/
desc "rebuild .MacOSX/environment.plist"
task :sync_path do
  `defaults write $HOME/.MacOSX/environment PATH "$PATH"`
  `cp ~/.MacOSX/environment.plist ~/projects/dotfiles/.MacOSX/`
end
