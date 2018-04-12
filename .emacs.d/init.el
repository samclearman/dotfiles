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
  :config
  (setq solarized-high-contrast-mode-line t)
  (load-theme 'solarized-dark t))
;; Get rid of chrome
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)

;; Mac keys that work
(setq mac-command-modifier 'control mac-option-modifier 'meta mac-control-modifier 'super)

;; Just quit (currently os x only)
(load (concat user-emacs-directory "scripts/quit"))

;; Fucking autosave
(setq backup-directory-alist
          `(("." . ,(concat user-emacs-directory "backups"))))
(setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))
(setq create-lockfiles nil)

;; No tabs
(setq-default indent-tabs-mode nil)

;; Indentation bullshit
;; (electric-indent-mode -1)
;; (global-set-key (kbd "S-<return>") 'newline)
;; (global-set-key (kbd "<return>") 'newline-and-indent)

;; Modes

;; js2 is a better javascript mode and supports jsx (maybe?)
(use-package js2-mode
  :ensure
  :config
    (setq js-indent-level 2)
    (setq-default js2-strict-trailing-comma-warning nil))

(use-package rjsx-mode
  :ensure
  :config
    (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode)))

;; Load packages / elisp files

;; Proper env vars in OS X emacs.app
(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

;; Magit
(use-package magit
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup)))

;; Smooth scrolling
(use-package sublimity
  :config
    (require 'sublimity)
    (require 'sublimity-scroll)
    (sublimity-mode 1))

;; Guess indent style
(use-package dtrt-indent
  :config (dtrt-indent-mode))

;; Highlight parens
(show-paren-mode)

;; Selecting by regions
(use-package expand-region
  :bind ("C-=" . er/expand-region))

;; Autcompletion
(use-package company
  :config (global-company-mode))

;; Ace jump
(use-package avy
  :bind (("C-," . avy-goto-word-1)
	 ("C-." . avy-goto-char)))

;; Ido
;; (use-package ido-vertical-mode
;;   :config
;;   (setq ido-enable-flex-matching t)
;;   (setq ido-everywhere t)
;;   (ido-mode 1)
;;   (ido-vertical-mode 1)
;;   (setq ido-vertical-define-keys 'C-n-and-C-p-only))

;; Ivy is a completion engine
(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "%d/%d "))


;; Swiper provides a more fully featured isearch interface.
(use-package swiper
  :ensure
  :bind ("C-S-s" . swiper))

;; Counsel enables better file searching
(use-package counsel
  :ensure
  :bind (("C-c g" . counsel-git)
	 ("C-x C-f" . counsel-find-file)
	 ("C-c j" . counsel-git-grep)))

;; imenu-list takes your imenu out of the minibuffer
(use-package imenu-list
  :ensure
  :bind ("C-\"" . imenu-list-smart-toggle))

;; speedbar is a browser which supports several types of objects
;; sr-speedbar puts speedbar in the same frame
;; projectile-speedbar makes the speedbar file browser use the project root
(use-package sr-speedbar
  :init
  :config (setq speedbar-use-images nil)
  :bind ("C-'" . sr-speedbar-toggle))
(use-package projectile-speedbar
  :ensure
  :init)



(use-package ace-window
  :ensure
  :bind ("M-o" . ace-window))
