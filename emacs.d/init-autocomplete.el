(require 'cedet)
(require 'semantic)
(semantic-mode t)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

(require 'semantic/ia)
(require 'semantic/bovine/gcc)

(require 'auto-complete-config)
(ac-config-default)

(provide 'init-autocomplete)
