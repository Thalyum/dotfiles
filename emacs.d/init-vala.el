;;; init-vala --- set up Vala mode
;;; Commentary:
;;; Code:

(require 'vala-mode)
(add-to-list 'auto-mode-alist '("\\.vala$" . vala-mode))
(add-to-list 'auto-mode-alist '("\\.vapi$" . vala-mode))
(add-to-list 'file-coding-system-alist '("\\.vala$" . utf-8))
(add-to-list 'file-coding-system-alist '("\\.vapi$" . utf-8))

(add-hook 'vala-mode-hook (lambda ()
			    (setq tab-width 4
				  c-basic-offset 4
				  indent-tabs-mode nil)))

(provide 'init-vala)
;;; init-vala.el ends here
