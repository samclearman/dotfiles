;; Use MELPA
(require 'package)
(setq package-enable-at-startup nil)
(setq custom-file "~/.emacs.d/custom.el")
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))

(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-always-ensure t)

;; Set up appearance
;; Solarized theme
(use-package solarized-theme
  :config (load-theme 'solarized-dark t))
;; Get rid of chrome
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Mac keys that work
(setq mac-command-modifier 'control mac-option-modifier 'meta)

;; Magit
(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)))

