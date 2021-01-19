(require 'cl-lib)

(defun my/new-empty-buffer ()
  (interactive)
  (switch-to-buffer (generate-new-buffer "Untitled")))
