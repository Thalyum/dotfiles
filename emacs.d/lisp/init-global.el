;;; init-global --- Global setup
;;; Commentary:
;;; Code:

;; Allow reuse of one Emacs instance
(server-start)

;; User Interface
(setq inhibit-startup-message t)
(menu-bar-mode 0)
(if (display-graphic-p)
  (progn
    (menu-bar-mode 1)
    (tool-bar-mode 0)
    (scroll-bar-mode -1)))
(fset 'yes-or-no-p 'y-or-n-p)

;; Editing
(setq fill-column 78)
(setq mode-require-final-newline nil)
(setq-default truncate-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'column-enforce-mode)
(global-column-enforce-mode t)
(setq column-enforce-column 79)

(dolist (hook '(text-mode-hook
		rst-mode-hook))
  (add-hook hook 'turn-on-auto-fill))

(setq backup-directory-alist '(("" . "~/.emacs.d/backups")))

(require 'whitespace)
(add-hook 'prog-mode-hook 'whitespace-mode)
(setq whitespace-style
      '(empty line-tails tabs tab-mark trailing))
(add-hook 'prog-mode-hook (lambda ()
			   (setq show-trailing-whitespace t)))

;; Syntax checking
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Spell checking
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "en_US")
(dolist (hook '(text-mode-hook
		rst-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1))))
(dolist (hook '(c-mode-hook
		c++-mode-hook
		python-mode-hook))
  (add-hook hook 'flyspell-prog-mode))

;; Search
(add-hook 'prog-mode-hook
	  (lambda ()
	    (modify-syntax-entry ?_ "w")))

(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(require 'recentf)

(electric-indent-mode 1)
(dolist (hook '(rst-mode-hook
		yaml-mode))
  (add-hook 'rst-mode-hook (lambda ()
			     (set (make-local-variable 'electric-indent-mode)
				  nil))))

;; Encryption
(require 'epa-file)
(epa-file-enable)

(provide 'init-global)
;;; init-global ends here
