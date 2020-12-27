(use-package emacs
  :preface
  (defvar ian/indent-width 4) ; change this value to your preferred width
  :config
  (setq frame-title-format '("Personal Emacs")
        frame-resize-pixelwise t
        default-directory "~/")

  (tool-bar-mode -1)
  (menu-bar-mode -1)

  ;; better scrolling experience
  (setq scroll-margin 0
        scroll-conservatively 101 ; > 100
        scroll-preserve-screen-position t
        auto-window-vscroll nil)

  ;; Always use spaces for indentation
  (setq-default indent-tabs-mode nil
                tab-width ian/indent-width))

(use-package auto-package-update
  :defer 10
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

(use-package zenburn-theme)
(load-theme 'zenburn t)

;; TODO https://www.reddit.com/r/emacs/comments/5p3njk/help_terminal_zsh_control_characters_in_prompt/
(use-package shell-pop
  :defer t
  :custom
    (shell-pop-universal-key "C-t")
    (shell-pop-window-size 30)
    (shell-pop-window-position "bottom")
    (shell-pop-term-shell "/bin/zsh"))
(setq shell-file-name "/bin/zsh")
(setq system-uses-terminfo nil)

(use-package which-key
  :diminish
  :defer 5
  :config (which-key-mode)
	  (which-key-setup-side-window-bottom)
	  (setq which-key-idle-delay 0.05))

(use-package diminish
  :defer 5
    :config
	(diminish  'org-indent-mode))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config (add-hook 'with-editor-mode-hook #'evil-insert-state))

(use-package htmlize :defer t)

(use-package org-bullets
  :hook (org-mode . org-bullets-mode))

(use-package dash)

(use-package s)

(use-package f)

(use-package undo-tree
  :diminish
  :config
  (global-undo-tree-mode)
  (setq undo-tree-visualizer-timestamps t)
  (setq undo-tree-visualizer-diff t))

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-company-use-tng nil)
  (evil-collection-init))
(use-package evil-magit)

(defun my/evil-yank-advice (orig-fn beg end &rest args)
    (pulse-momentary-highlight-region beg end)
    (apply orig-fn beg end args)) 
(advice-add 'evil-yank :around 'my/evil-yank-advice)

(defun my/switch-to-scratch-buffer (&optional arg)
    "Switch to scratch buffer"
    (interactive "P")
    (switch-to-buffer (get-buffer-create "*scratch*")))

(use-package hydra)
;; Buffer
(defhydra hydra-buffer (global-map "C-x b")
    "buffer"
    ("S" my/switch-to-scratch-buffer "Switch to scratch buffer"))
;; File
(defhydra hydra-buffer (global-map "C-x f")
    "file"
    ("s" save-buffer "Save"))
;; Zoom
(defhydra hydra-zoom (global-map "C-x z")
    "zoom"
    ("+" text-scale-increase "in")
    ("-" text-scale-decrease "out"))
