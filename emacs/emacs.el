(setq inhibit-startup-message t)	; disable startup message
(menu-bar-mode -1)			; hide menu bar
(tool-bar-mode -1)			; hide tool bar
(column-number-mode)  		       	; show column numbers
(global-display-line-numbers-mode)	; show line numbers

;; Configure scroll behaviour
(setq scroll-margin 3
      scroll-step 1
      hscroll-step 1
      hscroll-margin 1
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      mouse-wheel-scroll-amount '(2 ((shift) . 1))	; mouse scrolls by 2 lines, by 1 if shift is held
      mouse-wheel-progressive-speed nil)


;; --------------------------------------------------
;; Using straight.el for package management
;; --------------------------------------------------

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Set up use-package integration with straight.el
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; --------------------------------------------------

;; Configure color theme
;; https://github.com/hlissner/emacs-doom-themes
(use-package doom-themes
  :config
  (load-theme 'doom-molokai t))

;; Configure doom-modeline status bar
;; https://github.com/seagle0128/doom-modeline
(use-package doom-modeline
  :init (doom-modeline-mode t)
  :custom ((doom-modeline-height 15)))

;; Magit git porcelain
;; https://github.com/magit/magit
(use-package magit)

;; Rainbow delimiters
;; https://github.com/Fanael/rainbow-delimiters
(use-package rainbow-delimiters)
(with-eval-after-load 'rainbow-delimiters
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))


;; Ivy, Counsel and Swiper
;; https://github.com/abo-abo/swiper
(use-package ivy
  :diminish
  :config
  (ivy-mode)
  (setq ivy-use-virtual-buffers t
	ivy-count-format "(%d/%d) "))

(use-package counsel
  :after ivy
  :config (counsel-mode))

;; Ivy-rich: Rich output from Ivy and Counsel
;; https://github.com/Yevgnen/ivy-rich
(use-package ivy-rich
  :hook (counsel-mode . ivy-rich-mode)
  :config
  (setq ivy-rich-parse-remote-buffer nil))

;; Use Ivy to search and diff files
;; https://github.com/redguardtoo/find-file-in-project
(use-package find-file-in-project)
