;;; init-ui --- sets up ui
;;; Commentary:
;;; Code:
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(setq-default inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook (lambda () (setq truncate-lines nil)))

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(setq doom-modeline-height 40)
(setq doom-modeline-icon t)
(setq doom-modeline-lsp t)

(provide 'init-ui)
;;; init-ui.el ends here
