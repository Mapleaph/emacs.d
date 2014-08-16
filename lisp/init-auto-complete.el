(add-to-list 'load-path (expand-file-name "site-lisp/auto-complete" user-emacs-directory))
(require 'auto-complete-config)
(global-auto-complete-mode t)

(setq-default ac-expand-on-auto-complete t)
(setq-default ac-auto-start t)
(setq-default ac-dwim t)

(setq tab-always-indent 'complete)

(add-to-list 'completion-styles 'initials t)

(add-to-list 'ac-dictionary-directories (expand-file-name "site-lisp/auto-complete/dict" user-emacs-directory))

(provide 'init-auto-complete)
