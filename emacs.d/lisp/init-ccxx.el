;;; init-ccxx --- setup C/C++
;;; Commentary:
;;; Code:

(defun init-c/enable-ac ()
  (add-to-list 'ac-sources 'ac-source-semantic-raw)
  (add-to-list 'ac-sources 'ac-source-semantic))

(add-hook 'c-mode-common-hook (lambda()
				(init-c/enable-ac)
			        (c-set-style "linux")
			        (c-set-offset 'inextern-lang 0)
			        (modify-syntax-entry ?_ "w")))

(add-hook 'c++-mode-hook (lambda()
			   (init-c/enable-ac)
			   (c-set-style "stroustrup")
			   (setq c-basic-offset 4
				 tab-width 4
				 c-tab-always-indent nil)
			   (c-set-offset 'innamespace 0)
			   (c-set-offset 'inextern-lang 0)
			   (modify-syntax-entry ?_ "w")))

(define-skeleton insert-c-header-guards
  "Skeleton for inclusion guards in C header file"
  nil
  '(setq tag (subst-char-in-string
	      ?. ?_
	      (subst-char-in-string
	       ?- ?_
	       (upcase (file-name-nondirectory buffer-file-name)))))
  "#ifndef "tag"\n"
  "#define "tag"\n\n"
  "#endif /* "tag" */")

(define-skeleton insert-cxx-namespace
  "Skeleton for C++ namespace"
  nil
  '(setq tag (capitalize (read-from-minibuffer "Namespace? ")))
  "namespace " tag "\n"
  "{\n\n"
  "} // namespace " tag)

(provide 'init-ccxx)
;;; init-ccxx.el ends here