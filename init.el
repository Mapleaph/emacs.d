(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))


(require 'init-editing-utils)
(require 'init-gui-frames)

(require 'init-exec-path)
(require 'init-themes)
(require 'init-org)
(require 'init-auto-complete)
(require 'init-dired)
(require 'init-markdown)
(require 'init-elpa)
(require 'init-xcscope)
(require 'init-etags)

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
  ;; hs-mode toggling
  (global-set-key (kbd "<f7>") 'hs-toggle-hiding)

(wk-key-init)
;; END: wk-key-init


;; BEGIN: wk-c-mode-common-hook

(defun wk-c-mode-common-hook()
  (c-set-style "K&R")
;;  (setq c-default-style "awk")
  (setq c-basic-offset 4
		indent-tabs-mode t)
  (c-toggle-auto-hungry-state t)
  (define-key c-mode-base-map [(return)] 'newline-and-indent))
(add-hook 'c-mode-common-hook 'wk-c-mode-common-hook)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'c-mode-skeleton-pair-hook)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
;; END: wk-c-mode-common-hook


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


;; open bookmarks on startup
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")


(provide 'init)
