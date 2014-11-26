(defun word-definition-lookup ()
  "Look up the word under cursor in a browser."
  (interactive)
  (browse-url (concat "http://dictionary.cambridge.org/dictionary/english-chinese-simplified/" (thing-at-point 'symbol))))

(provide 'init-useful-utils)
