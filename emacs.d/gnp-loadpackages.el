;; gnp-loadpackages.el
(load "~/.emacs.d/gnp-packages.el")

;; magit
(require 'magit)
(define-key global-map (kbd "C-c m") 'magit-status)
;; - hopefully temp, also consdier looking at:
;; https://raw.githubusercontent.com/magit/magit/next/Documentation/RelNotes/1.4.0.txt
(setq magit-last-seen-setup-instructions "1.4.0")

;; yasnippet
(require 'yasnippet)
(yas-global-mode 1)
;; Useful: M-x yas-describe-tables
;; Consider uncommenting this if I ever get a set of custom snippets installed.
(yas-load-directory "~/.emacs.d/snippets")
;; (add-hook 'term-mode-hook (lambda()
;;                             (setq yas-dont-activate t)))
;; Need to get yasnippet working with web-mode
;;  as per https://github.com/capitaomorte/yasnippet/issues/396
(add-hook 'web-mode-hook #'(lambda () (yas-activate-extra-mode 'html-mode)))

;; Python stuff
(require 'elpy)
;; Check the Elpy config with M-x elpy-config
;; - This assumes we are using python3 _only_!
(setq elpy-rpc-python-command "python")
(elpy-enable)
;; Use C-c C-c to activate interactive interpreter
(setq python-shell-interpreter "ipython")
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
;; For some reason, I need to set all my web-mode colors by hand.
;; See http://web-mode.org, because I may need to set css, json, etc.
;; Also note, the Apple Terminal only "supports" 8 colors
;;  black, red, green, yellow, blue, magenta, cyan, white
;; Check available colors with `M-x list-colors-display`
(set-face-attribute 'web-mode-doctype-face nil :foreground "magenta")
(set-face-attribute 'web-mode-html-tag-face nil :foreground "cyan")
(set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "yellow")
(set-face-attribute 'web-mode-html-attr-name-face nil :foreground "green")
(set-face-attribute 'web-mode-html-attr-value-face nil :foreground "blue")
(set-face-attribute 'web-mode-html-attr-equal-face nil :foreground "yellow1")
(set-face-attribute 'web-mode-html-tag-custom-face nil :foreground "cyan")
;; JS
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; 3d Design
(autoload 'scad-mode "scad-mode" "Major mode for editing SCAD code." t)
(add-to-list 'auto-mode-alist '("\\.scad$" . scad-mode))
