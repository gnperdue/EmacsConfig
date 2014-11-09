;; SBCL set-up
(setq inferior-lisp-program "sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; Set tabs to spaces, then set tab to 4 spaces (marks)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 200 4))

;; Show column numbers by defaul
(setq column-number-mode t)

;; Spelling - probationary...
(setq ispell-program-name "/usr/local/bin/ispell")

;; Markdown
(add-to-list 'load-path "~/.emacs.d/markdown/")
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.txt\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
