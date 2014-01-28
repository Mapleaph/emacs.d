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

(provide 'init-dired)
