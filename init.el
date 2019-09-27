(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(if (fboundp 'tool-bar-mode)(tool-bar-mode -1))
(if (fboundp 'menu-bar-mode)(menu-bar-mode -1))
(if (fboundp 'scroll-bar-mode)(scroll-bar-mode -1))

(electric-pair-mode t)
(show-paren-mode t)
(global-linum-mode t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(save-place-mode 1)

(setq c-default-style "linux")
(setq-default c-basic-offset 4
              tab-width 4
	          indent-tabs-mode nil)

(add-hook 'after-init-hook 'global-company-mode)

(require 'powerline)
(powerline-default-theme)

(load-theme 'molokai t)

(global-set-key (kbd "M-g c") 'avy-goto-char)
(global-set-key (kbd "M-g l") 'avy-goto-line)

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq search-default-mode #'char-fold-to-regexp)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)

(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode)
              (ggtags-mode 1))))
(setq-local imenu-create-index-function #'ggtags-build-imenu-index)

(require 'rg)
(rg-enable-default-bindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rg ggtags counsel swiper ivy avy powerline company molokai-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
