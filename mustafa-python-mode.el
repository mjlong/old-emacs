;;; My python mode stuff

;; remove wisent-python hook
(remove-hook 'python-mode-hook 'wisent-python-default-setup)

;; Autoload python-mode for .py files
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))

;;; Electric pairs
(add-hook 'python-mode-hook
	  (lambda ()
	    (define-key py-mode-map "\"" 'electric-pair)
	    (define-key py-mode-map "\'" 'electric-pair)
	    (define-key py-mode-map "\(" 'electric-pair)
	    (define-key py-mode-map "["  'electric-pair)
	    (define-key py-mode-map "{"  'electric-pair)))

(defun electric-pair ()
  "Insert character pair without surrounding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))
;;; End Electric pairs

;; ipython

(setq ipython-command (or (m-expand-prog-path "ipython") ""))
(setq ipython-completion-command-string
      "print(get_ipython().Completer.all_completions('%s')[0]) #PYTHON-MODE SILENT\n")
(require 'ipython)

;;; Virtualenv
(require 'virtualenv)
(setq virtualenv-root "~/.virtualenv")

;;; Pymacs
(require 'pymacs)

;; add py subdir to pymacs load path
(add-to-list 'pymacs-load-path "~/.emacs.d/py/")

(autoload 'pymacs-appy "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(setq pymacs-auto-restart t)
