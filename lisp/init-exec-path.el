(add-to-list 'load-path (expand-file-name "site-lisp/exec-path-from-shell" user-emacs-directory))
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)

(provide 'init-exec-path)
