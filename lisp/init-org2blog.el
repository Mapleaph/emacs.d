(add-to-list 'load-path (expand-file-name "site-lisp/metaweblog" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/xml-rpc" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/org2blog" user-emacs-directory))


(require 'metaweblog)
(require 'xml-rpc)
(require 'org2blog)

(setq org2blog/wp-blog-alist '(("Michael's Blog!"
                                :url "http://localhost/wordpress/xmlrpc.php"
                                :username "mapleaph"
                                :wp-code nil
                                :tags-as-categories nil
                                :keep-new-lines t
                                :confirm t
                                )))

(provide 'init-org2blog)
