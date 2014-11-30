;; gnp-loadpackages.el
(load "~/.emacs.d/gnp-packages.el")

;; magit
(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;; Consider uncommenting this if I ever get a set of custom snippets installed.
;; (yas-load-directory "~/.emacs.d/snippets")
;; (add-hook 'term-mode-hook (lambda()
;;                             (setq yas-dont-activate t)))

;; Python stuff
(elpy-enable)
(elpy-use-ipython)
