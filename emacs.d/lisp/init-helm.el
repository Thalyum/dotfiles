;;; init-helm --- Setup Helm
;;; Commentary:
;;; Code:
(require 'helm-config)
(require 'helm-misc)
(require 'helm-projectile)
(require 'helm-locate)
(require 'helm-ack)
(setq helm-quick-update t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-always-two-windows t)
(helm-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-map (kbd "C-z")  'helm-select-action)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

(set-face-attribute 'helm-selection nil
		    :background "SlateGrey"
		    :foreground "Black")

(provide 'init-helm)
;;; init-helm ends here
