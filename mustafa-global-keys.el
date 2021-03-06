;; all my global key bindings

;; On window split, switch to other buffer intsead of opening the same one
(global-set-key "\C-x2" '(lambda () (interactive) 
			     (split-window)
			     (other-window 1)
			     (switch-to-buffer (other-buffer))))

(global-set-key "\C-x3" '(lambda ()
			   (interactive)
			   (split-window-horizontally)
			   (other-window 1)
			   (switch-to-buffer (other-buffer))))

;; start shell
(global-set-key "\C-x!" '(lambda () (interactive) 
			   (split-window)
			   (other-window 1)
			   (multi-term)))

;;slime close parens at point
(global-set-key "\C-c\C-q" 'slime-close-all-parens-in-sexp)

;; ido-imenu
(global-set-key "\C-x\C-i" 'ido-imenu)

;; ido find tags
(global-set-key "\C-x\C-u" 'm-ido-find-tag)

;; ido bookmarks
(global-set-key "\C-xrb" '(lambda ()
			      (interactive)
			      (bookmark-jump 
			       (assoc (ido-completing-read "Bookmarks: " 
							   (mapcar '(lambda (x) (car x)) bookmark-alist)) bookmark-alist))))
;; ibuffer
(global-set-key "\C-x\C-b" 'ibuffer-other-window)