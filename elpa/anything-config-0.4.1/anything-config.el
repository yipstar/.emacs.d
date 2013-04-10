;;; anything-config.el --- Predefined configurations for `anything.el'

;; Filename: anything-config.el

;; Description: Predefined configurations for `anything.el'
;; Author: Tassilo Horn <tassilo@member.fsf.org>
;; Maintainer: Tassilo Horn <tassilo@member.fsf.org>
;;             rubikitch    <rubikitch@ruby-lang.org>
;;             Thierry Volpiatto <thierry.volpiatto@gmail.com>
;; Copyright (C) 2007 ~ 2011, Tassilo Horn, all rights reserved.
;; Copyright (C) 2009, Andy Stewart, all rights reserved.
;; Copyright (C) 2009 ~ 2011, rubikitch, all rights reserved.
;; Copyright (C) 2009 ~ 2011, Thierry Volpiatto, all rights reserved.
;; Created: 2009-02-16 21:38:23
;; Version: 0.4.1
;; URL: http://www.emacswiki.org/emacs/download/anything-config.el
;; Keywords: anything, anything-config
;; Compatibility: GNU Emacs 22 ~ 23
;;
;; Features that might be required by this library:
;;
;; `anything'
;;

;;; This file is NOT part of GNU Emacs

;;; License
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth
;; Floor, Boston, MA 02110-1301, USA.

;;; !NOTICE!
;;
;; If this file does not work, upgrade anything.el!
;; http://www.emacswiki.org/cgi-bin/wiki/download/anything.el

;;; Commentary:
;;
;; Predefined configurations for `anything.el'
;;
;; For quick start, try `anything-for-files' to open files.
;;
;; To configure anything you should define anything command
;; with your favorite sources, like below:
;;
;; (defun my-anything ()
;;   (interactive)
;;   (anything-other-buffer
;;    '(anything-c-source-buffers
;;      anything-c-source-file-name-history
;;      anything-c-source-info-pages
;;      anything-c-source-info-elisp
;;      anything-c-source-man-pages
;;      anything-c-source-locate
;;      anything-c-source-emacs-commands)
;;    " *my-anything*"))
;;
;; Then type M-x my-anything to use sources.
;;
;; Defining own command is better than setup `anything-sources'
;; directly, because you can define multiple anything commands with
;; different sources. Each anything command should have own anything
;; buffer, because M-x anything-resume revives anything command.

;;; Autodoc documentation:
;;  ---------------------

;;  * Commands defined here are:
;; [EVAL] (autodoc-document-lisp-buffer :type 'command :prefix "anything-" :docstring t)
;; `anything-configuration'
;; Customize `anything'.
;; `anything-c-describe-anything-bindings'
;; [OBSOLETE] Describe `anything' bindings.
;; `anything-mini'
;; Preconfigured `anything' lightweight version		(buffer -> recentf).
;; `anything-for-files'
;; Preconfigured `anything' for opening files.
;; `anything-recentf'
;; Preconfigured `anything' for `recentf'.
;; `anything-info-at-point'
;; Preconfigured `anything' for searching info at point.
;; `anything-info-emacs'
;; Preconfigured anything for Emacs manual index.
;; `anything-show-kill-ring'
;; Preconfigured `anything' for `kill-ring'. It is drop-in replacement of `yank-pop'.
;; `anything-minibuffer-history'
;; Preconfigured `anything' for `minibuffer-history'.
;; `anything-gentoo'
;; Preconfigured `anything' for gentoo linux.
;; `anything-imenu'
;; Preconfigured `anything' for `imenu'.
;; `anything-google-suggest'
;; Preconfigured `anything' for google search with google suggest.
;; `anything-yahoo-suggest'
;; Preconfigured `anything' for Yahoo searching with Yahoo suggest.
;; `anything-for-buffers'
;; Preconfigured `anything' for buffer.
;; `anything-buffers+'
;; Enhanced preconfigured `anything' for buffer.
;; `anything-bbdb'
;; Preconfigured `anything' for BBDB.
;; `anything-locate'
;; Preconfigured `anything' for Locate.
;; `anything-w3m-bookmarks'
;; Preconfigured `anything' for w3m bookmark.
;; `anything-firefox-bookmarks'
;; Preconfigured `anything' for firefox bookmark.
;; `anything-colors'
;; Preconfigured `anything' for color.
;; `anything-bookmarks'
;; Preconfigured `anything' for bookmarks.
;; `anything-c-pp-bookmarks'
;; Preconfigured `anything' for bookmarks		(pretty-printed).
;; `anything-c-insert-latex-math'
;; Preconfigured anything for latex math symbols completion.
;; `anything-register'
;; Preconfigured `anything' for Emacs registers.
;; `anything-man-woman'
;; Preconfigured `anything' for Man and Woman pages.
;; `anything-org-keywords'
;; Preconfigured `anything' for org keywords.
;; `anything-emms'
;; Preconfigured `anything' for emms sources.
;; `anything-eev-anchors'
;; Preconfigured `anything' for eev anchors.
;; `anything-bm-list'
;; Preconfigured `anything' for visible bookmarks.
;; `anything-timers'
;; Preconfigured `anything' for timers.
;; `anything-list-emacs-process'
;; Preconfigured `anything' for emacs process.
;; `anything-occur'
;; Preconfigured Anything for Occur source.
;; `anything-browse-code'
;; Preconfigured anything to browse code.
;; `anything-org-headlines'
;; Preconfigured anything to show org headlines.
;; `anything-kill-buffers'
;; Preconfigured `anything' to kill buffer you selected.
;; `anything-regexp'
;; Preconfigured anything to build regexps and run query-replace-regexp against.
;; `anything-insert-buffer-name'
;; Insert buffer name.
;; `anything-insert-symbol'
;; Insert current symbol.
;; `anything-insert-selection'
;; Insert current selection.
;; `anything-show-buffer-only'
;; [OBSOLETE] Only show sources about buffer.
;; `anything-show-bbdb-only'
;; [OBSOLETE] Only show sources about BBDB.
;; `anything-show-locate-only'
;; [OBSOLETE] Only show sources about Locate.
;; `anything-show-info-only'
;; [OBSOLETE] Only show sources about Info.
;; `anything-show-imenu-only'
;; [OBSOLETE] Only show sources about Imenu.
;; `anything-show-files-only'
;; [OBSOLETE] Only show sources about File.
;; `anything-show-w3m-bookmarks-only'
;; [OBSOLETE] Only show source about w3m bookmark.
;; `anything-show-colors-only'
;; [OBSOLETE] Only show source about color.
;; `anything-show-kill-ring-only'
;; [OBSOLETE] Only show source about kill ring.
;; `anything-show-this-source-only'
;; Only show this source.
;; `anything-test-sources'
;; List all anything sources for test.
;; `anything-select-source'
;; Select source.
;; `anything-toggle-all-marks'
;; Toggle all marks.
;; `anything-find-files-down-one-level'
;; Go down one level like unix command `cd ..'.
;; `anything-find-files'
;; Preconfigured `anything' for anything implementation of `find-file'.
;; `anything-write-file'
;; Preconfigured `anything' providing completion for `write-file'.
;; `anything-insert-file'
;; Preconfigured `anything' providing completion for `insert-file'.
;; `anything-dired-rename-file'
;; Preconfigured `anything' to rename files from dired.
;; `anything-dired-copy-file'
;; Preconfigured `anything' to copy files from dired.
;; `anything-dired-symlink-file'
;; Preconfigured `anything' to symlink files from dired.
;; `anything-dired-hardlink-file'
;; Preconfigured `anything' to hardlink files from dired.
;; `anything-dired-bindings'
;; Replace usual dired commands `C' and `R' by anything ones.
;; `anything-do-grep'
;; Preconfigured anything for grep.
;; `anything-c-grep-precedent-file'
;; Go to precedent file in `anything-do-grep'.
;; `anything-c-grep-next-or-prec-file'
;; Go to next or precedent candidate file in anything grep buffer.
;; `anything-c-etags-select'
;; Preconfigured anything for etags.
;; `anything-filelist'
;; Preconfigured `anything' to open files instantly.
;; `anything-filelist+'
;; Preconfigured `anything' to open files/buffers/bookmarks instantly.
;; `anything-c-describe-attributes'
;; Display the full documentation of ANYTHING-ATTRIBUTE (a symbol).
;; `anything-M-x'
;; Preconfigured `anything' for Emacs commands.
;; `anything-manage-advice'
;; Preconfigured `anything' to disable/enable function advices.
;; `anything-bookmark-ext'
;; Preconfigured `anything' for bookmark-extensions sources.
;; `anything-simple-call-tree'
;; Preconfigured `anything' for simple-call-tree. List function relationships.
;; `anything-mark-ring'
;; Preconfigured `anything' for `anything-c-source-mark-ring'.
;; `anything-global-mark-ring'
;; Preconfigured `anything' for `anything-c-source-global-mark-ring'.
;; `anything-all-mark-rings'
;; Preconfigured `anything' for `anything-c-source-global-mark-ring' and `anything-c-source-mark-ring'.
;; `anything-yaoddmuse-cache-pages'
;; Fetch the list of files on emacswiki and create cache file.
;; `anything-yaoddmuse-emacswiki-edit-or-view'
;; Preconfigured `anything' to edit or view EmacsWiki page.
;; `anything-yaoddmuse-emacswiki-post-library'
;; Preconfigured `anything' to post library to EmacsWiki.
;; `anything-eval-expression'
;; Preconfigured anything for `anything-c-source-evaluation-result'.
;; `anything-eval-expression-with-eldoc'
;; Preconfigured anything for `anything-c-source-evaluation-result' with `eldoc' support. 
;; `anything-surfraw'
;; Preconfigured `anything' to search PATTERN with search ENGINE.
;; `anything-call-source'
;; Preconfigured `anything' to call anything source.
;; `anything-call-source-from-anything'
;; Call anything source within `anything' session.
;; `anything-execute-anything-command'
;; Preconfigured `anything' to execute preconfigured `anything'.
;; `anything-create-from-anything'
;; Run `anything-create' from `anything' as a fallback.
;; `anything-create'
;; Preconfigured `anything' to do many create actions from STRING.
;; `anything-top'
;; Preconfigured `anything' for top command.
;; `anything-select-xfont'
;; Preconfigured `anything' to select Xfont.
;; `anything-world-time'
;; Preconfigured `anything' to show world time.
;; `anything-apt'
;; Preconfigured `anything' : frontend of APT package manager.
;; `anything-c-shell-command-if-needed'
;; Not documented.
;; `anything-c-run-external-command'
;; Preconfigured `anything' to run External PROGRAM asyncronously from Emacs.
;; `anything-ratpoison-commands'
;; Preconfigured `anything' to execute ratpoison commands.
;; `anything-c-set-variable'
;; Set value to VAR interactively.
;; `anything-c-adaptive-save-history'
;; Save history information to file given by `anything-c-adaptive-history-file'.
;; `anything-c-toggle-match-plugin'
;; Toggle anything-match-plugin.

;;  * User variables defined here:
;; [EVAL] (autodoc-document-lisp-buffer :type 'user-variable :prefix "anything-" :var-value t)
;; `anything-c-use-standard-keys'
;; Default Value: nil
;; `anything-c-adaptive-history-file'
;; Default Value: "~/.emacs.d/anything-c-adaptive-history"
;; `anything-c-adaptive-history-length'
;; Default Value: 50
;; `anything-c-google-suggest-url'
;; Default Value: "http://google.com/complete/search?output=toolbar&q="
;; `anything-c-google-suggest-search-url'
;; Default Value: "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
;; `anything-google-suggest-use-curl-p'
;; Default Value: nil
;; `anything-c-yahoo-suggest-url'
;; Default Value: "http://search.yahooapis.com/WebSearchService/V1/relatedSuggestion?appid=G [...]
;; `anything-c-yahoo-suggest-search-url'
;; Default Value: "http://search.yahoo.com/search?&ei=UTF-8&fr&h=c&p="
;; `anything-c-boring-buffer-regexp'
;; Default Value: "\\	(\\` \\)\\|\\*anything\\| \\*Echo Area\\| \\*Minibuf"
;; `anything-c-boring-file-regexp'
;; Default Value: "/\\	(?:\\(?:\\.\\(?:git\\|hg\\|svn\\)\\|CVS\\|_darcs\\)\\)\\(?:/\\|$\\)\\| [...]
;; `anything-kill-ring-threshold'
;; Default Value: 10
;; `anything-su-or-sudo'
;; Default Value: "su"
;; `anything-for-files-prefered-list'
;; Default Value:	(anything-c-source-ffap-line anything-c-source-ffap-guesser anything-c-sou [...]
;; `anything-create--actions-private'
;; Default Value: nil
;; `anything-allow-skipping-current-buffer'
;; Default Value: t
;; `anything-c-enable-eval-defun-hack'
;; Default Value: t
;; `anything-tramp-verbose'
;; Default Value: 0
;; `anything-raise-command'
;; Default Value: nil
;; `anything-command-map-prefix-key'
;; Default Value: "<f5> a"
;; `anything-c-find-files-show-icons'
;; Default Value: nil
;; `anything-c-find-files-icons-directory'
;; Default Value: "/usr/local/share/emacs/23.2.91/etc/images/tree-widget/default"
;; `anything-c-browse-code-regexp-lisp'
;; Default Value: "^ *	(def\\(un\\|subst\\|macro\\|face\\|alias\\|advice\\|struct\\|type\\|th [...]
;; `anything-c-browse-code-regexp-python'
;; Default Value: "\\<def\\>\\|\\<class\\>"
;; `anything-c-browse-code-regexp-alist'
;; Default Value:	((lisp-interaction-mode . "^ *(def\\(un\\|subst\\|macro\\|face\\|alias\\|a [...]
;; `anything-c-external-programs-associations'
;; Default Value: nil
;; `anything-c-etags-tag-file-name'
;; Default Value: "TAGS"
;; `anything-c-etags-tag-file-search-limit'
;; Default Value: 10
;; `anything-c-filelist-file-name'
;; Default Value: nil

;;  * Anything sources defined here:
;; [EVAL] (autodoc-document-lisp-buffer :type 'anything-source :prefix "anything-" :any-sname t)
;; `anything-c-source-regexp'					(Regexp Builder)
;; `anything-c-source-buffers'					(Buffers)
;; `anything-c-source-buffer-not-found'				(Create buffer)
;; `anything-c-source-buffers+'					(Buffers)
;; `anything-c-source-file-name-history'			(File Name History)
;; `anything-c-source-files-in-current-dir'			(Files from Current Directory)
;; `anything-c-source-files-in-current-dir+'			(Files from Current Directory)
;; `anything-c-source-find-files'				(Find Files (`C-.':Go to precedent level))
;; `anything-c-source-write-file'				(Write File (`C-.':Go to precedent level))
;; `anything-c-source-insert-file'				(Insert File (`C-.':Go to precedent level))
;; `anything-c-source-copy-files'				(Copy Files (`C-.':Go to precedent level))
;; `anything-c-source-symlink-files'				(Symlink Files (`C-.':Go to precedent level))
;; `anything-c-source-hardlink-files'				(Hardlink Files (`C-.':Go to precedent level))
;; `anything-c-source-file-cache-initialized'			()
;; `anything-c-source-file-cache'				(File Cache)
;; `anything-c-source-locate'					(Locate)
;; `anything-c-source-etags-select'				(Etags)
;; `anything-c-source-recentf'					(Recentf)
;; `anything-c-source-ffap-guesser'				(File at point)
;; `anything-c-source-ffap-line'				(File/Lineno at point)
;; `anything-c-source-files-in-all-dired'			(Files in all dired buffer.)
;; `anything-c-source-filelist'					(FileList)
;; `anything-c-source-info-pages'				(Info Pages)
;; `anything-c-source-info-elisp'				(Info index: elisp)
;; `anything-c-source-info-cl'					(Info index: cl)
;; `anything-c-source-info-org'					(Info index: org)
;; `anything-c-source-info-ratpoison'				(Info index: ratpoison)
;; `anything-c-source-info-zsh'					(Info index: zsh)
;; `anything-c-source-info-bash'				(Info index: bash)
;; `anything-c-source-info-coreutils'				(Info index: coreutils)
;; `anything-c-source-info-fileutils'				(Info index: fileutils)
;; `anything-c-source-info-find'				(Info index: find)
;; `anything-c-source-info-sh-utils'				(Info index: sh-utils)
;; `anything-c-source-info-textutils'				(Info index: textutils)
;; `anything-c-source-info-libc'				(Info index: libc)
;; `anything-c-source-info-make'				(Info index: make)
;; `anything-c-source-info-automake'				(Info index: automake)
;; `anything-c-source-info-autoconf'				(Info index: autoconf)
;; `anything-c-source-info-emacs-lisp-intro'			(Info index: emacs-lisp-intro)
;; `anything-c-source-info-emacs'				(Info index: emacs)
;; `anything-c-source-info-elib'				(Info index: elib)
;; `anything-c-source-info-eieio'				(Info index: eieio)
;; `anything-c-source-info-gauche-refe'				(Info index: gauche)
;; `anything-c-source-info-guile'				(Info index: guile)
;; `anything-c-source-info-guile-tut'				(Info index: guile-tut)
;; `anyt