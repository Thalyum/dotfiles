;;; init-sh --- setup shell scripting mode
;;; Commentary:
;;; Code:

(add-hook 'sh-mode-hook (lambda ()
			  (setq sh-basic-offset 4
				sh-indentation 4
				indent-tabs-mode nil)))

(provide 'init-sh)
;;; init-sh.el ends here