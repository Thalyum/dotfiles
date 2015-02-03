;;; init-editorconfig --- set up Editorconfig
;;; Commentary:
;;; Code::

(require 'editorconfig)

(add-to-list 'auto-mode-alist
	     '("\\.editorconfig\\'" . (lambda ()
				       (conf-mode))))

(provide 'init-editorconfig)
;;; init-editorconfig.el ends here
