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

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1))

(use-package helm
  :config
  (helm-mode 1))

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
;;(use-package evil-magit)

(load (concat (file-name-directory load-file-name)
          "functions.el"))

(defun my/evil-yank-advice (orig-fn beg end &rest args)
    (pulse-momentary-highlight-region beg end)
    (apply orig-fn beg end args)) 
(advice-add 'evil-yank :around 'my/evil-yank-advice)

;; Borrowed from Spacemacs
(defun my/switch-to-scratch-buffer (&optional arg)
    "Switch to scratch buffer"
    (interactive "P")
    (switch-to-buffer (get-buffer-create "*scratch*")))

;; Borrowed from Spacemacs
;; https://github.com/syl20bnr/spacemacs/blob/77d84b14e057aadc6a71c536104b57c617600f35/core/core-funcs.el#L342
(defun my/alternate-buffer (&optional window)
    "Switch back and forth between current and last buffer in the
     current window."
     (interactive)
     (cl-destructuring-bind (buf start pos)
         (or (cl-find (window-buffer window) (window-prev-buffers)
                 :key #'car :test-not #'eq)
         (list (other-buffer) nil nil))
         (if (not buf)
             (message "Last buffer not found.")
             (set-window-buffer-start-and-point window buf start pos))))

(use-package general)
(require 'general)
(general-create-definer my-leader-def
  :prefix "SPC")

(global-set-key (kbd "C-s") 'save-buffer)
;; Top
(my-leader-def
  :keymaps 'normal
  "TAB" 'my/alternate-buffer
  "SPC" 'helm-M-x
  "1" 'winum-select-window-1
  "2" 'winum-select-window-2
  "3" 'winum-select-window-3
  "4" 'winum-select-window-4
  "5" 'winum-select-window-5
  "6" 'winum-select-window-6
  "7" 'winum-select-window-7
  "8" 'winum-select-window-8
  "9" 'winum-select-window-9
  "0" 'treemacs-select-window)

;; Application
(my-leader-def 
  :keymaps 'normal
  "au" 'undo-tree-visualize)

;; Buffer
(my-leader-def 
  :keymaps 'normal
  "bb" 'helm-buffers-list
  "bS" 'my/switch-to-scratch-buffer
  "bN" 'my/new-empty-buffer
  "bs" 'save-buffer)

;; File
(my-leader-def
  :keymaps 'normal
  "ff" 'helm-find-files)

;; Git
(my-leader-def
  :keymaps 'normal
  "gg" 'magit-status)

;; Projectile
(my-leader-def
  :keymaps 'normal
  "pg" 'projectile-grep
  "pf" 'projectile-find-file
  "pb" 'projectile-display-buffer)

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

(use-package treemacs
  :ensure t
  :defer t
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-read-string-input             'from-child-frame
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

 (use-package treemacs-icons-dired
   :after treemacs dired
   :ensure t
   :config (treemacs-icons-dired-mode))

 (use-package treemacs-magit
   :after treemacs magit
   :ensure t)
