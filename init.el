(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(add-to-list 'package-archives '("elpa" . "https://elpa.gnu.org/packages/") t)


(package-initialize)

(setq make-backup-files nil)
(setq auto-save-default nil)

(add-to-list 'default-frame-alist '(font . "Source Code Pro-11" ))
(electric-pair-mode 1)

(package-install 'exec-path-from-shell)
(package-install 'flycheck)
(package-install 'lsp-mode)
(package-install 'lsp-ui)
(package-install 'company-lsp)
(package-install 'company)
;;(package-install 'python-mode)
(package-install 'swiper)
(package-install 'counsel)
(package-install 'ivy)
(package-install 'yasnippet)
(package-install 'yasnippet-snippets)
(package-install 'dracula-theme)
(package-install 'ivy-rich)
;;(package-install 'lsp-html)
(package-install 'solarized-theme)

(global-hl-line-mode t)
(show-paren-mode t)
(setq show-paren-style 'mixed)
(transient-mark-mode t)

(which-function-mode 1)
(setq-default tab-width 4 indent-tabs-mode nil)

;;(load-theme 'dracula t)
(load-theme 'solarized-light t)

(exec-path-from-shell-initialize)


;;(require 'flycheck)
;;(global-flycheck-mode)

;;(require 'company)
;;(global-company-mode)
;;(setq company-idle-delay 0)
;;(setq company-minimum-prefix-length 2)
;;(setq company-selection-wrap-around t)
;;(define-key company-active-map (kbd "M-n") nil)
;;(define-key company-active-map (kbd "M-p") nil)
;;(define-key company-active-map (kbd "C-n") 'company-select-next)
;;(define-key company-active-map (kbd "C-p") 'company-select-previous)
;;(define-key company-active-map (kbd "C-h") nil)
;;(define-key company-active-map (kbd "C-i") 'company-complete-selection)
;;(define-key company-active-map [tab] 'company-complete-selection)

;;(defvar company-mode/enable-yas t
;;  "Enable yasnippet for all backends.")
;;(defun company-mode/backend-with-yas (backend)
;;  (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
;;	  backend
;;	(append (if (consp backend) backend (list backend))
;;			'(:with company-yasnippet))))
;;(defun set-yas-as-company-backend ()
;;  (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
;;(add-hook 'company-mode-hook 'set-yas-as-company-backend)



;;(require 'lsp-mode)
;;(add-hook 'prog-mode-hook #'lsp)
;;(require 'lsp-ui)
;;(add-hook 'lsp-mode-hook 'lsp-ui-mode)

;;(require 'company-lsp)
;;(push 'company-lsp company-backends)

(require 'ivy)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq ivy-extra-directories nil)
(setq ivy-re-builders-alist
      '((t . ivy--regex-plus)))

(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(defvar counsel-find-file-ignore-regexp (regexp-opt '("./" "../")))

(global-set-key "\C-s" 'swiper)
(defvar swiper-include-line-number-in-search t)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (yasnippet ivy swiper company lsp-mode yasnippet-snippets lsp-ui lsp-html ivy-rich flycheck exec-path-from-shell dracula-theme counsel company-lsp auto-highlight-symbol))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
