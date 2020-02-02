(setq custom-file "~/.emacs.d/custom.el")
(ignore-errors (load custom-file))

(setq enable-local-variables :safe)

(require 'package)

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))

(package-initialize)
(package-refresh-contents)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package auto-package-update
  :defer 10
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

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
  :config (global-set-key (kbd "C-x g") 'magit-status))

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
