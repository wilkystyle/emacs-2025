;;; mike-adonis-darker-theme-vanilla.el --- adapted from Saeed Nazari's beautiful Adonis theme for VS Code -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: July 11, 2024
;; Author: Mike Wilkerson <https://github.com/wilkystyle>
;; Maintainer: Mike Wilkerson <https://github.com/wilkystyle>
;; Source:
;;
;;; Code:

;;
;;; Variables

(defgroup mike-adonis-darker-theme nil
  "Options for the `mike-adonis-darker' theme."
  :group 'faces)

(defcustom mike-adonis-darker-padded-modeline nil
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'mike-adonis-darker-theme
  :type '(choice integer boolean))

;;
;;; Theme definition

(deftheme mike-adonis-darker
  "A dark(er) theme inspired by doom-palenight-theme")

(let* (;; Color palette
       (bg           "#1D1F23")
       (bg-alt       "#242837")
       (base0        "#1c1f2b")
       (base1        "#1e212e")
       (base2        "#232635")
       (base3        "#3C435E")
       (base4        "#4E5579")
       (base5        "#676E95")
       (base6        "#697098")
       (base7        "#717CB4")
       (base8        "#A6Accd")
       (comment-grey "#788494")
       (fg           "#EFEFEF")
       (fg-alt       "#BFC7D5")

       (grey base5)

       (red          "#ff5370")
       (orange       "#f78c6c")
       (green        "#9DD274")
       (teal         "#44b9b1")
       (yellow       "#EDCB66")
       (blue         "#82aaff")
       (dark-blue    "#7986E7")
       (magenta      "#FF7A90")
       (violet       "#BB9CF7")
       (cyan         "#85DAFB")
       (dark-cyan    "#80cbc4")

       ;; face categories
       (highlight      magenta)
       (vertical-bar   base2)
       (selection      base4)
       (builtin        blue)
       (comments       comment-grey)
       (doc-comments   yellow)
       (constants      violet)
       (functions      green)
       (keywords       magenta)
       (methods        blue)
       (operators      cyan)
       (type           cyan)
       (strings        yellow)
       (variables      cyan)
       (numbers        orange)
       (region         base3)
       (error          red)
       (warning        yellow)
       (success        green)
       (vc-modified    blue)
       (vc-added       green)
       (vc-deleted     red)

       ;; custom categories
       (modeline-bg     bg)
       (modeline-bg-alt "#1C1E22") ; manually darkened bg
       (modeline-fg     fg-alt)
       (modeline-fg-alt comments)

       (-modeline-pad
        (when mike-adonis-darker-padded-modeline
          (if (integerp mike-adonis-darker-padded-modeline)
              mike-adonis-darker-padded-modeline
            4))))

  (custom-theme-set-faces
   'mike-adonis-darker

   ;; Base theme face overrides
   `(default ((t (:background ,bg :foreground ,fg))))
   `(cursor ((t (:background ,fg))))
   `(region ((t (:background ,region :extend t))))
   `(highlight ((t (:background ,highlight :foreground ,bg))))
   `(hl-line ((t (:background ,base2 :extend t))))
   `(fringe ((t (:background ,bg))))
   `(vertical-border ((t (:foreground ,vertical-bar))))
   `(window-divider ((t (:foreground ,vertical-bar))))
   `(window-divider-first-pixel ((t (:foreground ,vertical-bar))))
   `(window-divider-last-pixel ((t (:foreground ,vertical-bar))))

   ;; Font lock faces
   `(font-lock-builtin-face ((t (:foreground ,builtin))))
   `(font-lock-comment-face ((t (:foreground ,comments))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,comments))))
   `(font-lock-doc-face ((t (:foreground ,doc-comments))))
   `(font-lock-constant-face ((t (:foreground ,constants))))
   `(font-lock-function-name-face ((t (:foreground ,functions))))
   `(font-lock-keyword-face ((t (:foreground ,keywords))))
   `(font-lock-string-face ((t (:foreground ,strings))))
   `(font-lock-type-face ((t (:foreground ,type))))
   `(font-lock-variable-name-face ((t (:foreground ,variables))))
   `(font-lock-warning-face ((t (:foreground ,warning))))

   ;; Search
   `(isearch ((t (:background ,yellow :foreground ,bg :weight bold))))
   `(lazy-highlight ((t (:background ,base4 :foreground ,fg :weight bold))))

   ;; Line numbers
   `(line-number ((t (:foreground ,base3))))
   `(line-number-current-line ((t (:foreground ,fg-alt))))

   ;; Mode line
   `(mode-line ((t (:background ,modeline-bg :foreground ,modeline-fg
                                ,@(when -modeline-pad `(:box (:line-width ,-modeline-pad :color ,modeline-bg)))))))
   `(mode-line-inactive ((t (:background ,modeline-bg-alt :foreground ,modeline-fg-alt
                                         ,@(when -modeline-pad `(:box (:line-width ,-modeline-pad :color ,modeline-bg-alt)))))))

   ;; Tooltip
   `(tooltip ((t (:background "#202326" :foreground ,fg)))) ; manually lightened bg

   ;; Minibuffer
   `(minibuffer-prompt ((t (:foreground ,blue))))

   ;; Error/warning/success
   `(error ((t (:foreground ,error))))
   `(warning ((t (:foreground ,warning))))
   `(success ((t (:foreground ,success))))

   ;; Magit overrides
   `(magit-diff-revision-summary ((t (:foreground ,yellow :background ,bg))))
   `(magit-diff-revision-summary-highlight ((t (:foreground ,yellow :background ,bg))))

   ;; css-mode / scss-mode
   `(css-proprietary-property ((t (:foreground ,orange))))
   `(css-property ((t (:foreground ,green))))
   `(css-selector ((t (:foreground ,blue))))

   ;; dired-k
   `(dired-k-commited ((t (:foreground ,base4))))
   `(dired-k-modified ((t (:foreground ,vc-modified))))
   `(dired-k-ignored ((t (:foreground ,cyan))))
   `(dired-k-added ((t (:foreground ,vc-added))))

   ;; doom-modeline
   `(doom-modeline-buffer-path ((t (:foreground ,green :weight bold))))
   `(doom-modeline-buffer-major-mode ((t (:inherit doom-modeline-buffer-path))))

   ;; js2-mode
   `(js2-jsdoc-tag ((t (:foreground ,magenta))))
   `(js2-object-property ((t (:foreground ,yellow))))
   `(js2-object-property-access ((t (:foreground ,cyan))))
   `(js2-function-param ((t (:foreground ,violet))))
   `(js2-jsdoc-type ((t (:foreground ,base8))))
   `(js2-jsdoc-value ((t (:foreground ,cyan))))

   ;; man
   `(Man-overstrike ((t (:inherit bold :foreground ,magenta))))
   `(Man-underline ((t (:inherit underline :foreground ,blue))))

   ;; org
   `(org-block ((t (:background ,base2))))
   `(org-block-background ((t (:background ,base2))))
   `(org-block-begin-line ((t (:background ,base2))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,magenta))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,orange))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,green))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,violet))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,yellow))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,blue))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,teal))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,dark-cyan))))

   ;; rjsx-mode
   `(rjsx-tag ((t (:foreground ,red))))
   `(rjsx-attr ((t (:foreground ,yellow :slant italic :weight medium))))

   ;; markdown-mode
   `(markdown-code-face ((t (:background ,base2))))
   ))

(provide-theme 'mike-adonis-darker)

;;; mike-adonis-darker-theme-vanilla.el ends here
