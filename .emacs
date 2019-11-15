(require 'package)
(advice-add 'package-install
	    :filter-args '(lambda (args) (cons (car args) '(t))))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(electric-pair-mode 1)
(global-display-line-numbers-mode 1)

(setq make-backup-files nil)

(bind-keys ("C-h" . delete-backward-char)
	   :map emacs-lisp-mode-map
	   ("C-c C-c" . eval-buffer))

(use-package paren
  :defer t
  :init
  (show-paren-mode 1)
  :config
  (setq show-paren-style 'expression))

(use-package winner
  :defer t
  :bind (("C-z" . winner-undo))
  :init
  (winner-mode 1))

(use-package skk
  :ensure ddskk
  :config
  (setq default-input-method "japanese-skk"))

(use-package ivy
  :ensure t
  :defer t
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t
	enable-recursive-minibuffers t))

(use-package swiper
  :ensure t
  :defer t
  :bind (("C-s" . swiper)))

(use-package counsel
  :ensure t
  :defer t
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ("<f1> f" . counsel-describe-function)
	 ("<f1> v" . counsel-describe-variable)
	 ("C-c g" . counsel-git)
	 ("C-c j" . counsel-git-grep)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history)))

(use-package twittering-mode
  :ensure t
  :defer t
  :config
  (setq twittering-icon-mode t))
