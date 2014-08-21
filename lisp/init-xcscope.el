(setq exec-path (cons "/usr/local/bin" exec-path))

(add-to-list 'load-path (expand-file-name "site-lisp/xcscope" user-emacs-directory))
(require 'xcscope)
(setq cscope-do-not-update-database t)
(add-hook 'c-mode-common-hook '(lambda() (require 'xcscope)))

(provide 'init-xcscope)
