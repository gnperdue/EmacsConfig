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
(require 'elpy)
;; Check the Elpy config with M-x elpy-config
(setq elpy-rpc-python-command "python3")
(elpy-enable)
;; Use C-c C-c to activate interactive interpreter
(setq python-shell-interpreter "ipython3")
;; remap some functions - C-z is usually "suspend frame"
(global-unset-key "\C-z")  
(global-set-key (kbd "C-z <down>") 'elpy-nav-forward-block)
(global-set-key (kbd "C-z <up>") 'elpy-nav-backward-block)
(global-set-key (kbd "C-z <right>") 'elpy-nav-forward-indent)
(global-set-key (kbd "C-z <left>") 'elpy-nav-backward-indent)
(global-set-key (kbd "C-z C-z <down>") 'elpy-nav-move-iblock-down)
(global-set-key (kbd "C-z C-z <up>") 'elpy-nav-move-iblock-up)
(global-set-key (kbd "C-z C-z <right>") 'elpy-nav-move-iblock-right)
(global-set-key (kbd "C-z C-z <left>") 'elpy-nav-move-iblock-left)

;; Web stuff
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
