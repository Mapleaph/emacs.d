(setq-default blink-cursor-delay 0
              blink-cursor-interval 0.4
              vc-handled-backends nil
              visible-bell t
              compilation-scroll-output t
              grep-scroll-output t
              scroll-preserve-screen-position 'always
              show-paren-style 'expression
              show-paren-style 'parenthesis
              indent-tabs-mode nil
              tab-width 4
              ring-bell-function #'ignore
              use-dialog-box nil
              mouse-wheel-progressive-speed t
              x-select-enable-clipboard t
              comint-prompt-read-only t
              display-time-24hr-format t
              require-final-newline t
              parens-require-spaces nil
              kill-ring-max 1024
              view-read-only t
              comment-style 'multi-line
              auto-save-default nil
              make-backup-files nil
              read-file-name-completion-ignored-cas t
              frame-title-format '(" %f")
              user-mail-address "Mapleaph@me.com"
              user-full-name "Michael Wu"
              sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*"
              scroll-margin 3 scroll-conservatively 10000)


(defun wk-misc-init ()
  (global-linum-mode)
  (show-paren-mode)
;;  (electric-pair-mode)
  (icomplete-mode)
  (auto-image-file-mode)
  (mouse-avoidance-mode 'animate)

  (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
  (ansi-color-for-comint-mode-on)
  (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

  (add-hook 'before-save-hook 'whitespace-cleanup)

  ;;(delete 'Git vc-handled-backends)
  (windmove-default-keybindings)
  (fset 'yes-or-no-p 'y-or-n-p))

(wk-misc-init)


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


;; BEGIN: c-mode-skeleton-pair-hook
(defun c-mode-skeleton-pair-hook()
  (setq-default skeleton-pair t)
  (global-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (global-set-key (kbd "\"") 'skeleton-pair-insert-maybe)
  (global-set-key (kbd "\'") 'skeleton-pair-insert-maybe)
  (global-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (global-set-key (kbd "{") 'skeleton-pair-insert-maybe))
;; END: c-mode-skeleton-pair-hook

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


;; BEGIN: toggle-line-spacing
(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.5)
    (setq-default line-spacing nil)))
;; ENS: toggle-line-spacing

(provide 'init-editing-utils)
