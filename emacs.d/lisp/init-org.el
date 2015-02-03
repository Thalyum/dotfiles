;;; init-org --- setup Org Mode
;;; Commentary:
;;; Code:
(require 'org)

(setq org-directory "~/Notes/org/")
(setq org-agenda-files (list (concat org-directory "perso")
			     (concat org-directory "work")))
(setq org-default-notes-file (concat org-directory "/notes.org"))

(global-set-key (kbd "C-c r") 'org-capture)

(setq org-clock-persistence-insinuate t)
(setq org-clock-in-resume t)

(org-agenda-to-appt)
(setq org-agenda-include-diary t)

(provide 'init-org)
;;; init-org ends here
