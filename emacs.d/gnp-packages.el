;; gnp-packages.el

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;; Define the required packages
(defvar required-packages
  '(magit
    yasnippet
    elpy
    ) "a list of packages that must be installed at launch")

;; Method to check if all required packages are installed
(defun packages-installed-p()
  (loop for p in required-packages
     when (not (package-installed-p p)) do (return nil)
     finally (return t)))
;; If not all of the packages are installed, check and install the missing one-by-one.
(unless (packages-installed-p)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" "... done.")
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

