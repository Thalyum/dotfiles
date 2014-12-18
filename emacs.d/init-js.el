;;; init-js --- setup Javascript and JSON
;;; Commentary:
;;; Code:

(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)
(add-hook 'js-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil
		  tab-width 4)))

(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json\\'\\|\\.jshintrc\\'" . json-mode))
(add-hook 'json-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil
		  tab-width 4)))

(provide 'init-js)
;;; init-js.el ends here