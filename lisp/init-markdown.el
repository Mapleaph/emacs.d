(add-to-list 'load-path (expand-file-name "site-lisp/markdown-mode" user-emacs-directory))

(require 'markdown-mode)
(autoload 'markdown-mode' "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(provide 'init-markdown)
