;;; init-taskjuggler -- set up taskjuggler-mode
;;; Commentary:
;;; Code:
(require 'taskjuggler-mode)

(add-hook 'taskjuggler-mode-hook 'hs-minor-mode)

(provide 'init-taskjuggler)
;;; init-taskjuggler ends here
