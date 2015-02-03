;;; init-evil --- setup Evil
;;; Commentary:
;;; Code:
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
   "a" 'helm-ack
   "b" 'helm-mini
   "d" 'dired
   "f" 'helm-semantic-or-imenu
   "k" 'kill-buffer
   "m" 'helm-man-woman
   "o" 'delete-other-windows
   "p" 'project-explorer-helm
   "s" 'split-window-below
   "t" 'helm-imenu
   "v" 'split-window-right
   "w" 'other-window
   "x" 'helm-M-x
   "E" 'project-explorer-open
   "O" 'helm-occur
   "P" 'projectile-commander
   "S" 'helm-projectile-switch-project)

(require 'evil-org)

(require 'evil)
(evil-mode 1)

(setq evil-want-fine-undo t)

;; Make C-g work like <esc>
(define-key evil-normal-state-map "\C-g" 'evil-normal-state)
(define-key evil-visual-state-map "\C-g" 'evil-normal-state)
(define-key evil-insert-state-map "\C-g" 'evil-normal-state)

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-ns-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-completion-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-must-match-map [escape] 'abort-recursive-edit)
(define-key minibuffer-local-isearch-map [escape] 'abort-recursive-edit)

;; Change cursor color depending on mode
(setq evil-emacs-state-cursor '("red" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("red" bar))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(define-key evil-ex-map "e" 'helm-find-files)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)

(evil-set-initial-state 'project-explorer-mode 'emacs)

(evil-ex-define-cmd "make" 'compile)

(require 'evil-escape)
(evil-escape-mode)

(require 'evil-nerd-commenter)
(evilnc-default-hotkeys)

(require 'evil-surround)
(global-evil-surround-mode 1)

(provide 'init-evil)
;;; init-evil ends here
