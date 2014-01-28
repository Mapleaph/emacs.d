(add-to-list 'load-path (expand-file-name "site-lisp/themes/color-theme" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/themes/wk-color-theme" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "site-lisp/themes/theme-changer" user-emacs-directory))

(require 'color-theme)
(require 'wk-color-theme-dark)
(require 'theme-changer)

(color-theme-initialize)
(color-theme-blippblopp)
(setq calendar-location-name "天津")
(setq calendar-latitude 39.08)
(setq calendar-longitude 117.19)
(setq theme-changer-mode "color-theme")
(change-theme 'color-theme-blippblopp 'wk-color-theme-dark)

(provide 'init-themes)
