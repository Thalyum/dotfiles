;;; init-python --- setup Python
;;; Commentary:
;;; Code:

(require 'python)
(require 'anaconda-mode)
(require 'ac-anaconda)

(add-hook 'python-mode-hook 'anaconda-mode)

(add-hook 'python-mode-hook 'ac-anaconda-setup)

(add-hook 'python-mode-hook 'eldoc-mode)

(setq python-shell-interpreter "ipython"
       python-shell-prompt-regexp "In \\[[0-9]+\\]: "
       python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
       python-shell-completion-setup-code
       "from IPython.core.completerlib import module_completion"
       python-shell-completion-module-string-code
       "';'.join(module_completion('''%s'''))\n"
       python-shell-completion-string-code
       "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key python-mode-map (kbd "RET") 'newline-and-indent)
	    (setq indent-tabs-mode nil
		  tab-width 4
		  python-indent-offset 4)))

(add-to-list 'interpreter-mode-alist
             '("python3" . python-mode))

(provide 'init-python)
;;; init-python.el ends here
