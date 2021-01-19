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

(use-package helm)

(use-package winum
  :config
  (winum-mode))

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
  :defer 1
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

(load (concat (file-name-directory load-file-name)
          "functions.el"))

(defun my/evil-yank-advice (orig-fn beg end &rest args)
    (pulse-momentary-highlight-region beg end)
    (apply orig-fn beg end args)) 
(advice-add 'evil-yank :around 'my/evil-yank-advice)

(defun my/switch-to-scratch-buffer (&optional arg)
    "Switch to scratch buffer"
    (interactive "P")
    (switch-to-buffer (get-buffer-create "*scratch*")))

(use-package general)
(require 'general)
(general-create-definer my-leader-def
  :prefix "SPC")

;; Top
(my-leader-def
  :keymaps 'normal
  "SPC" 'helm-M-x
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  "4" 'winum-select-window-4
  "5" 'winum-select-window-5
  "6" 'winum-select-window-6
  "7" 'winum-select-window-7
  "8" 'winum-select-window-8
  "9" 'winum-select-window-9)

;; Buffer
(my-leader-def 
  :keymaps 'normal
  "bS" 'my/switch-to-scratch-buffer
  "bN" 'my/new-empty-buffer
  "bs" 'save-buffer)

;; File

;; Window
(my-leader-def
  :keymaps 'normal
  "wd" 'delete-window
  "w/" 'split-window-horizontally
  "w-" 'split-window-vertically)

;; Zoom
(my-leader-def
  :keymaps 'normal
  "z+" 'text-scale-increase
  "z-" 'text-scale-decrese)
