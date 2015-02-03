;;; init --- setup GNU Emacs
;;; Commentary:
;;; Code:
(add-to-list 'load-path "~/.emacs.d/lisp")

(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)

(require 'init-global)
;;(require 'init-color-theme)
;;(require 'init-org)
(require 'init-editorconfig)
;;(require 'init-evil)
(require 'init-powerline)
(require 'init-helm)
(require 'init-smooth-scrolling)
(require 'init-ccxx)
(require 'init-vala)
(require 'init-js)
(require 'init-python)
(require 'init-sh)
(require 'init-autocomplete)
(require 'init-taskjuggler)
(require 'init-magit)
(require 'init-projectile)
(require 'init-project-explorer)
(require 'init-yasnippet)
(require 'init-xcscope)
(require 'init-delight)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'init)
;;; init ends here
