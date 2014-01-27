;; options
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(x-mouse-click-focus-ignore-position t)
 '(mouse-drag-copy-region t)
 '(calendar-chinese-all-holidays-flag t)
 '(calendar-view-diary-initially-flag nil)
 '(delete-selection-mode t)
 '(column-number-mode t)
 '(current-language-environment "UTF-8")
 '(display-time-mode t)
 '(global-hl-line-mode t)
 '(inhibit-startup-screen t)
 ;; '(menu-bar-mode nil)
 '(safe-local-variable-values (quote ((todo-categories "personal" "food" "work") (todo-categories "work" "food"))))
 '(scroll-bar-mode nil)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
;; '(vc-handled-backends (quote (GIT SVN Hg Bzr CVS))))
;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "#101e2e" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal)))))
;; end


(defun wk-misc-custom-init ()
  (electric-pair-mode t)
  (setq electric-pair-pairs '(
                              (?\" . ?\")
                              (?\{ . ?\})
                              ))
  ;; show line number
  (global-linum-mode t)
  ;; open recently visited file
  (recentf-mode t)
  ;; hignlight matching parenthesis
  (show-paren-mode t)
  (setq show-paren-style 'expression)
  (setq show-paren-style 'parenthesis)
  ;; stop mixed tabs and spaces
  (setq-default indent-tabs-mode nil)
  (setq tab-width 4)
  ;; avoid shell bla
  (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
  ;; disable vc-git
  ;; (eval-after-load "vc"
  ;;   '(remove-hook 'find-file-hooks 'vc-find-file-hook))
  (delete 'Git vc-handled-backends)
  ;; disable noise making when scrolling and hitting the top or bottom of a buffer
  (setq ring-bell-function #'ignore)
  (winner-mode t)
  (setq scroll-margin 3 scroll-conservatively 10000)
  ;; ensure chinese sentence ending
  (setq sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*")
  (mouse-avoidance-mode 'animate)
  (setq user-full-name "Michael Wu")
  (setq user-mail-address "Mapleaph@me.com")
  (setq display-time-24hr-format t)
  ;; emacs shell color encoding
  (ansi-color-for-comint-mode-on)
  ;; set inferior shell prompt read-only
  (setq comint-prompt-read-only t)
  (auto-image-file-mode t)
  ;; windmove
  (windmove-default-keybindings)
  ;; icomplete
  (icomplete-mode 1)
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq use-dialog-box nil)
  ;; make mouse wheel not accelerate
  (setq mouse-wheel-progressive-speed nil)
  ;; editing
  (setq x-select-enable-clipboard t)
  ;; (add-hook 'before-save-hook 'time-stamp)
  ;; delete trailing whitespaces before save
  (add-hook 'before-save-hook 'whitespace-cleanup)
  ;; check last line to be a newline
  (setq require-final-newline t)
  ;; set insert parenthese without space
  (setq parens-require-spaces nil)
  ;; set kill-ring-max to 1024
  (setq kill-ring-max 1024)
  ;; enter view-mode when buffer is read-only
  (setq view-read-only t)
  ;; set comment style to multi-line
  (setq comment-style 'multi-line)
  ;; dont't generating temp file
  (setq auto-save-default nil)
  ;; don't generating backup file
  (setq make-backup-files nil)
  ;; case-insensitive when specifying the filename path in minibuffer
  (setq read-file-name-completion-ignored-cas t)
  ;; emacs title
  (setq frame-title-format '(" %f")))

(wk-misc-custom-init)
;; END: wk-misc-custom-init


;; BEGIN: wk-current-line-and-column
(defun wk-current-line-and-column ()
  "Get current line number and column number."
  (interactive)
  (message "Line %d, Column %d" (line-number-at-pos) (current-column)))

(global-set-key "\C-x?" 'wk-current-line-and-column)
;; END: wk-current-line-and-column


;; BEGIN: exec-path-from-shell, to change the emacs $PATH to system's $PATH
(add-to-list 'load-path "~/.emacs.d/lisp/exec-path-from-shell")
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
;; END: exec-path-from-shell


;; BEGIN: wk-key-init
(defun wk-key-init()
  ;; change default Meta key to C-c C-m
  (global-set-key "\C-c\C-m" 'execute-extended-command)
  ;; goto line
  (global-set-key (kbd "M-g") 'goto-line)
  ;; buffer switching keys
  (global-set-key (kbd "C-<") 'previous-buffer)
  (global-set-key (kbd "C->") 'next-buffer)
  ;; comment-dwim
  (global-set-key "\C-c\C-c" 'comment-dwim)
  ;; ibuffer
  (global-set-key "\C-x\C-b" 'ibuffer)
  ;; set mark
  (global-set-key "\M-m" 'set-mark-command)
  ;; bind delete-other-windows with <f1>
  (define-key global-map [(f1)] 'delete-other-windows)
  ;; key binding for elisp-index-search
  (global-set-key (kbd "<f8>") 'elisp-index-search))
(wk-key-init)
;; END: wk-key-init


;; BEGIN: color-theme
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme")
(add-to-list 'load-path "~/.emacs.d/lisp/wk-color-theme")
(add-to-list 'load-path "~/.emacs.d/lisp/color-theme-tango")
(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/base16-color-themes/")
(require 'color-theme)
(color-theme-initialize)
(require 'wk-color-theme-dark)
(require 'color-theme-tango)
(color-theme-blippblopp)
;; END: color-theme


;; BEGIN: theme-changer
(add-to-list 'load-path "~/.emacs.d/lisp/theme-changer")
(require 'theme-changer)
(setq calendar-location-name "天津")
(setq calendar-latitude 39.08)
(setq calendar-longitude 117.19)
(setq theme-changer-mode "color-theme")
(change-theme 'color-theme-blippblopp 'wk-color-theme-dark)
;; END: theme-changer


;; BEGIN: org-mode
(add-to-list 'load-path "~/.emacs.d/lisp/org-mode/lisp")
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
;; END: org-mode


;; BEGIN: wk-c-mode-common-hook
(defun wk-c-mode-common-hook()
  (c-set-style "lgfang")
  (setq-default c-basic-offset 4
                tab-width 4
                indent-tabs-mode nil)
  (c-toggle-auto-hungry-state t)
  (define-key c-mode-base-map [(return)] 'newline-and-indent))
(add-hook 'c-mode-common-hook 'wk-c-mode-common-hook)
;; END: wk-c-mode-common-hook


;; BEGIN: autocomplete
(add-to-list 'load-path "~/.emacs.d/lisp/auto-complete")
(require 'popup)
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/auto-complete/dict")
(ac-config-default)
;; END: autocomplete


;; BEGIN: his-match-paren
(defun his-match-paren (&optional arg)
  "Go to the matching paren if on a paren; otherwise insert %."
  (interactive "p")
  (cond ((looking-at "\\s\(")
         (forward-list 1)
         (backward-char 1))
        ((looking-at "\\s\)")
         (forward-char 1)
         (backward-list 1))
        (t (self-insert-command (or arg 1)))))

(global-set-key "%" 'his-match-paren)
;; END: his-match-paren


;; BEGIN: dired
(require 'dired-x)
;; dired-mode 下不折行显示
(defun my-dired-long-lines()
  (setq truncate-lines t))
(add-hook 'dired-after-readin-hook 'my-dired-long-lines)
;; wdired 提供修改文件名的一种非常方便方法。它把 dired-mode 当作一般的
;; 文本处理，这样无论是修改一个文件，还是批量修改文件都不是一般的爽。
(require 'wdired nil t)
(when (featurep 'wdired)
  (autoload 'wdired-change-to-wdired-mode "wdired")
  (define-key dired-mode-map "r" 'wdired-change-to-wdired-mode))
;; END: dired


;; BEGIN: auto-indent-region when yank a piece of code
(dolist (command '(yank yank-pop))
  (eval
   `(defadvice ,command (after indent-region activate)
      (and (not current-prefix-arg)
           (member major-mode
                   '(emacs-lisp-mode
                     lisp-mode
                     clojure-mode
                     scheme-mode
                     haskell-mode
                     ruby-mode
                     rspec-mode
                     python-mode
                     c-mode
                     c++-mode
                     objc-mode
                     latex-mode
                     js-mode
                     plain-tex-mode))
           (let ((mark-even-if-inactive transient-mark-mode))
             (indent-region (region-beginning) (region-end) nil))))))
;; END: auto-indent-region when yank a piece of code


;; BEGIN: predictive to latex
(add-to-list 'load-path "~/.emacs.d/lisp/predictive")
(add-to-list 'load-path "~/.emacs.d/lisp/predictive/latex")

(autoload 'predictive-mode "predictive" "predictive" t)
(set-default 'predictive-auto-add-to-dict t)
(setq predictive-main-dict 'rpg-dictionary
      predictive-auto-learn t
      predictive-add-to-dict-ask nil
      predictive-use-auto-learn-cache nil
      predictive-which-dict t)
;; END: predictive to latex


;; BEGIN: auctex
(mapc (lambda (mode)
        (add-hook 'LaTeX-mode-hook mode))
      (list 'LaTeX-math-mode
            'turn-on-reftex
            'linum-mode))

(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
             (setq TeX-command-default "XeLaTeX")
             (setq TeX-save-query nil)
             (setq TeX-show-compilation t)
             (setq TeX-auto-untabify t
                   TeX-engine 'xetex)
             (TeX-global-PDF-mode t)
             (imenu-add-menubar-index)
             (define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
             ))
;; END: auctex


;; BEGIN: latex skeleton
(define-skeleton latex-skeleton
  "Inserts a Latex page skeleton into current buffer."
  nil
  "\\documentclass[a4paper]{article}\n"
  "\\usepackage{xcolor}\n"
  "\\usepackage{fontspec}\n"
  "\\setmainfont{Microsoft YaHei}\n"
  "\\usepackage{zhspacing}\n"
  "\\usepackage{setspace}\n"
  "\\usepackage[colorlinks,linkcolor=blue]{hyperref}"
  "\\usepackage{listings}\n"
  "\\usepackage{courier}\n"
  "\\lstset{\n"
  "  language={bash},\n"
  "  %numbers=left,\n"
  "  numberstyle=\\tiny,\n"
  "  %stepnumber=2,\n"
  "  numbersep=5pt,\n"
  "  backgroundcolor=\\color{lightgray},\n"
  "  tabsize=4,\n"
  "  showtabs=false,\n"
  "  showspaces=false,\n"
  "  breaklines=true,\n"
  "  extendedchars=true,\n"
  "  framexleftmargin=10pt,\n"
  "  xleftmargin=10pt,\n"
  "  keywordstyle=\\color{red},\n"
  "  stringstyle=\\color{white},\n"
  "  showstringspaces=false\n"
  "}\n"
  "\\setlength{\\textwidth}{450pt}\n"
  "\\setlength{\\oddsidemargin}{0pt}\n"
  "\\setlength{\\topmargin}{0pt}\n"
  "\\setlength{\\headheight}{0pt}\n"
  "\\setlength{\\headsep}{0pt}\n"
  "\\setlength{\\parindent}{2em}\n"
  "\\setlength{\\textheight}{700pt}\n"
  "\\pagestyle{empty}\n"
  "\\begin{document}\n"
  "\\title{ " - " }\n"
  "\\maketitle\n"
  "\\begin{spacing}{2}\n"
  "\\begin{large}\n"
  "\\begin{enumerate}\n"
  "\\item\n"
  "\\end{enumerate}\n"
  "\\end{large}\n"
  "\\end{spacing}\n"
  "\\end{document}\n")

(global-set-key "\C-cl" 'latex-skeleton)
;; END: latex skeleton


;; BEGIN: diary
(setq diary-file "~/.emacs.d/lisp/diary/diary")
(setq diary-mail-addr "mapleaph@me.com")
;; END: diary


;; BEGIN: calendar
(setq chinese-calendar-celestial-stem ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
(setq chinese-calendar-terrestrial-branch ["子" "丑" "寅" "卯" "辰" "巳" "戊" "未" "申" "酉" "戌" "亥"])

(setq calendar-remove-frame-by-deleting t)
(setq calendar-week-start-day 1) ;; 设置星期一为每周的第一天
(setq mark-diary-entries-in-calendar t) ;; 标记calendar上有diary的日期
(setq mark-holidays-in-calendar t) ;; 为了突出有diary的日期，calendar上不标记节日
(setq view-calendar-holidays-initially t) ;; 打开calendar的时候不显示一堆节日

(global-set-key (kbd "<f5>") 'calendar)

;; 去掉不关心的节日，设定自己在意的节日，在 calendar 上用 h 显示节日
(setq christian-holidays t)
(setq hebrew-holidays nil)
(setq islamic-holidays nil)
(setq solar-holidays nil)
(setq general-holidays '((holiday-fixed 1 1 "元旦")
                         (holiday-fixed 2 14 "情人节")
                         (holiday-fixed 5 1 "劳动节")
                         (holiday-float 5 0 2 "母亲节")
                         (holiday-float 6 0 3 "父亲节")
                         (holiday-fixed 9 10 "教师节")
                         (holiday-fixed 10 1 "国庆节")
                         (holiday-fixed 12 25 "圣诞节")))
;; END: calendar


;; BEGIN: custom package archives
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages"))
;;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages"))

(package-initialize)
;; END: custom package archives


;; BEGIN: org2blog
(add-to-list 'load-path "~/.emacs.d/lisp/org2blog")
(add-to-list 'load-path "~/.emacs.d/lisp/metaweblog")
(add-to-list 'load-path "~/.emacs.d/lisp/xml-rpc")
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
;; END: org2blog


;; BEGIN: markdown-mode
(add-to-list 'load-path "~/.emacs.d/lisp/markdown-mode")
(require 'markdown-mode)
(autoload 'markdown-mode' "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; END: markdown-mode


;; BEGIN: toggle-line-spacing
(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.5)
    (setq-default line-spacing nil)))
;; ENS: toggle-line-spacing


;; BEGIN: w3m
(add-to-list 'load-path "~/.emacs.d/lisp/w3m")
(require 'w3m-load)
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)
(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.google.com")
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)
;; END: w3m


;; BEGIN: weibo
(add-to-list 'load-path "~/.emacs.d/lisp/weibo")
(require 'weibo)
;; END: weibo


;; open bookmarks on startup
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")

(provide 'init)
