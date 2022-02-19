(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)

(package-initialize)

(package-install 'exec-path-from-shell)
(package-install 'solarized-theme)
(package-install 'yaml-mode)
(package-install 'cmake-mode)
(package-install 'use-package)
(package-install 'vertico)
(package-install 'orderless)
(package-install 'consult)

;; disable crate backup file
(setq make-backup-files nil)
(setq auto-save-default nil)
;; disbable bell
(setq ring-bell-function 'ignore)
;; highlight pair
(electric-pair-mode 1)
;; highlight line
(global-hl-line-mode t)

(show-paren-mode t)
(setq show-paren-style 'mixed)
(transient-mark-mode t)

(which-function-mode 1)
(setq-default tab-width 4 indent-tabs-mode nil)

;; change font
(add-to-list 'default-frame-alist '(font . "Source Code Pro-11" ))
;;(load-theme 'dracula t)
;;(load-theme 'solarized-light t)

(exec-path-from-shell-initialize)

;; Enable vertico
(use-package vertico
  :init
  (vertico-mode)

  (setq vertico-count 15)
  (define-key vertico-map (kbd "C-r") 'vertico-previous)
  (define-key vertico-map (kbd "C-s") 'vertico-next)
  )

;; Configure directory extension.
(use-package vertico-directory
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package savehist
  :init
  (savehist-mode))

(use-package consult
  :bind (("C-s" . consult-line)
         ("C-r" . consult-line)
         ("C-x b" . consult-buffer))
  :config
  (consult-customize
   consult-line :prompt "Search ->  "))

(use-package emacs
  :init
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  (setq enable-recursive-minibuffers t))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(yaml-mode vertico use-package solarized-theme orderless exec-path-from-shell consult cmake-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
