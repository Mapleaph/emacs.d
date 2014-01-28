(add-to-list 'load-path (expand-file-name "site-lisp/org-mode" user-emacs-directory))
(require 'org)
(require 'org-latex)
(add-hook 'org-mode-hook
          '(lambda ()
             (setq truncate-lines nil)))

;; use stylesheet when exporting html
(defconst org-export-html-style-default
  "<link rel=\"stylesheet\" type=\"text/css\" href=\"stylesheet.css\">")

(setq org-export-language-setup
      (append org-export-language-setup '(("" "" "" "目录" ""))))

(provide 'init-org)
