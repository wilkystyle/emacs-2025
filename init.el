;; =============================================================================
;; BOOTSTRAP STRAIGHT.EL
;; =============================================================================
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq use-package-compute-statistics t)   ;; Run M-: (use-package-report) to see the results
(setq straight-use-package-by-default t)  ;; Always use package


;; =============================================================================
;; MODES
;; =============================================================================
(delete-selection-mode 1)
(electric-pair-mode 1)
(which-function-mode 1)
(which-key-mode 1)

;; =============================================================================
;; OPTIONS
;; =============================================================================
(setq sort-fold-case t)


;; =============================================================================
;; KEYBINDINGS
;; =============================================================================
(keymap-global-set "C-M-d" 'duplicate-dwim)
(keymap-global-set "C-M-k" 'kill-whole-line)
(keymap-global-set "C-x C-k" 'kill-buffer)
(keymap-global-set "M-;" '(lambda () (interactive) (save-excursion (comment-line 1))))
(keymap-global-set "M-c" 'capitalize-dwim)
(keymap-global-set "M-k" 'mark-paragraph)
(keymap-global-set "M-l" 'recenter-top-bottom)
(keymap-global-set "M-n" '(lambda () (interactive) (next-line 6)))
(keymap-global-set "M-o" 'other-window)
(keymap-global-set "M-p" '(lambda () (interactive) (previous-line 6)))
(keymap-global-set "M-u" 'downcase-dwim)
(keymap-global-set "M-U" 'upcase-dwim)
(keymap-global-set "M-z" 'zap-up-to-char)

(keymap-set minibuffer-mode-map "C-<return>" 'exit-minibuffer)


;; =============================================================================
;; HOOKS
;; =============================================================================
(add-hook 'prog-mode-hook (lambda () (interactive) (completion-preview-mode 1)))


;; =============================================================================
;; PACKAGES
;; =============================================================================
(use-package magit
  :bind (("C-M-<left>" . 'magit-blob-previous)
	       ("C-M-<right>" . 'magit-blob-next)
	       ("C-x v b" . 'magit-blame)
	       ("C-x v h" . 'magit-log-buffer-file)
	       ("C-x v l" . 'magit-log-current)
	       ("C-x v s" . 'magit-status))
  )

(use-package multiple-cursors
  :bind
  ("<s-mouse-1>" . mc/add-cursor-on-click)
  ("<C-mouse-1>" . mc/add-cursor-on-click)
  ("C-M-l" . mc/edit-ends-of-lines)
  ("C-M-n" . mc/mark-next-like-this)
  ("C-M-p" . mc/unmark-next-like-this)
  ("C-M-s" . mc/skip-to-next-like-this)
  ("C-x C-g" . mc/mark-all-like-this)
  )

(use-package expreg
  :bind
  ("C-M-h" . expreg-contract)
  ("M-h" . expreg-expand))
