(add-to-list 'load-path (expand-file-name "site-lisp/auto-complete" user-emacs-directory))
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name "site-lisp/auto-complete/dict" user-emacs-directory))
(ac-config-default)

(provide 'init-auto-complete)
