;;; init-deligh --- setup Delight
;;; commentary:
;;; Code:

(require 'delight)
(delight '((abbrev-mode nil "abrev")
	   (yas-minor-mode nil "yasnippet")
	   (eldoc-mode nil "eldoc")
	   (helm-mode nil "helm")
	   (auto-complete-mode nil "auto-complete")
	   (evil-escape-mode nil "evil-escape")
	   (undo-tree-mode nil "undo-tree")
	   (magit-auto-revert-mode nil "magit")
	   (whitespace-mode nil "whitespace")))

(provide 'init-delight)
;;; init-delight.el ends here