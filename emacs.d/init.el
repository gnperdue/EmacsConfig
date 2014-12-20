;; Basic customization - make sure this runs last by using a `hook`
(add-hook 'after-init-hook '(lambda()
                             (load "~/.emacs.d/gnp-noexternals.el")))

;; SBCL set-up
(setq inferior-lisp-program "sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-startup-animation nil)
(load (expand-file-name "~/quicklisp/slime-helper.el"))

;; SLIME set-up
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
(global-set-key (kbd "C-c s") 'slime-selector)

;; Set tabs to spaces, then set tab to 4 spaces (marks)
(setq-default indent-tabs-mode nil)
(setq tab-stop-list (number-sequence 4 200 4))

;; Show column numbers by default
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

;; Comment function (sort of...)
(defun toggle-comment-on-line ()
  "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))
(global-set-key (kbd "C-c /") 'toggle-comment-on-line)
(set-face-foreground 'font-lock-comment-face "blue")

;; Delete trailing whitespace
(add-hook 'local-write-file-hooks
          (lambda ()
            (delete-trailing-whitespace)
            nil))

;; Other custom packages
(load "~/.emacs.d/gnp-loadpackages.el")
