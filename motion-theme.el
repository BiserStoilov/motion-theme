;; motion-theme.el --- inspired by Textmate's Monokai -*- no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup motion-theme nil
  "Options for motion."
  :group 'doom-themes)

(defcustom motion-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'motion-theme
  :type 'boolean)

(defcustom motion-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'motion-theme
  :type 'boolean)

(defcustom motion-comment-bg motion-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'motion-theme
  :type 'boolean)

(defcustom motion-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'motion-theme
  :type '(choice integer boolean))

;;
(def-doom-theme motion
  "A dark, vibrant theme inspired by Textmate's Monokai."

  ;; name        gui       256       16
  ((bg         '("#1d2021" nil       nil))
   (bg-alt     '("#111415" nil       nil))
   (bg-alt2    '("#33393B" nil       nil))

   (base0      '("#111414" "black"   "black"      )) ; (self-defined)
   (base1      '("#1d2021" "#1d2021" "brightblack")) ; bg0_h
   (base2      '("#33393B" "#33393B" "brightblack")) ; bg0
   (base3      '("#111414" "#111414" "brightblack")) ; bg1
   (base4      '("#33393B" "#33393B" "brightblack")) ; bg3
   (base5      '("#1d2021" "#1d2021" "brightblack")) ; bg4
   (base6      '("#33393B" "#33393B" "brightblack")) ; gray
   (base7      '("#ebdbb2" "#ebdbb2" "brightblack")) ; fg2
   (base8      '("#ebdbb2" "#ebdbb2" "brightwhite")) ; fg0
   (fg         '("#ebdbb2" "#ebdbb2" "brightwhite")) ; fg/fg1
   (fg-alt     '("#ebdbb2" "#ebdbb2" "brightwhite")) ; fg2

   (grey       '("#00839F" "#00839F" "brightblack"))   ; gray
   (red        '("#e74c3c" "#e74c3c" "red"))           ; bright-red
   (magenta    '("#e74c3c" "#e74c3c" "magenta"))       ; red
   (violet     '("#458588" "#458588" "brightmagenta")) ; bright-purple
   (orange     '("#d79921" "#d79921" "orange"))        ; bright-orange
   (yellow     '("#ffb964" "#ffb964" "yellow"))        ; bright-yellow
   (teal       '("#5e8d60" "#5e8d60" "green"))         ; bright-aqua
   (green      '("#ffb964" "#ffb964" "green"))         ; bright-green
   (dark-green '("#98971a" "#98971a" "green"))         ; green
   (blue       '("#00839F" "#00839F" "brightblue"))    ; bright-blue
   (dark-blue  '("#458588" "#458588" "blue"))          ; blue
   (cyan       '("#83a598" "#83a598" "brightcyan"))    ; bright-aqua
   (dark-cyan  '("#8ec07c" "#8ec07c" "cyan"))          ; aqua


   ;; --color0: #282828;
   ;; --color1: #cc241d;
   ;; --color2: #98971a;
   ;; --color3: #d79921;
   ;; --color4: #458588;
   ;; --color5: #b16286;
   ;; --color6: #689d6a;
   ;; --color7: #a89984;
   ;; --color8: #928374;
   ;; --color9: #fb4934;
   ;; --color10: #b8bb26;
   ;; --color11: #fabd2f;
   ;; --color12: #83a598;
   ;; --color13: #d3869b;
   ;; --color14: #8ec07c;
   ;; --color15: #ebdbb2;
   ;; --color256: #1d2021;
   ;; --color257: #ebdbb2;



   ;; face categories
   (highlight      yellow)
   (vertical-bar   grey)
   (selection      bg-alt2)
   (builtin        orange)
   (comments       (if motion-brighter-comments magenta grey))
   (doc-comments   (if motion-brighter-comments (doom-lighten magenta 0.2) (doom-lighten fg-alt 0.25)))
   (constants      violet)
   (functions      cyan)
   (keywords       red)
   (methods        cyan)
   (operators      cyan)
   (type           yellow)
   (strings        green)
   (variables      cyan)
   (numbers        violet)
   (region         violet)
   (error          red)
   (warning        yellow)
   (success        green)

   (vc-modified    (doom-darken blue 0.15))
   (vc-added       (doom-darken green 0.15))
   (vc-deleted     (doom-darken red 0.15))

   ;; custom categories
   (-modeline-pad
    (when motion-padded-modeline
      (if (integerp motion-padded-modeline)
          motion-padded-modeline
        4)))

   (org-quote `(,(doom-lighten (car bg) 0.05) "#1f1f1f")))

  ;; --- extra faces ------------------------
  (
   ;;;;;;;; Editor ;;;;;;;;
   (cursor :background orange)
   (region :background base0 :foreground yellow)
   (hl-line :background bg-alt)
   ((line-number &override) :foreground cyan)
   ((line-number-current-line &override) :background bg-alt2 :foreground fg :bold t)

   ;; Vimish-fold
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background bg-alt2 :weight 'light)
   ((vimish-fold-mouse-face &override) :foreground fg :background yellow :weight 'light)
   ((vimish-fold-fringe &override) :foreground magenta :background magenta)

   ;;;;;;;; Doom-modeline ;;;;;;;;
   (mode-line
    :background bg-alt2 :foreground (doom-lighten fg-alt 0.25)
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color base3)))

   (mode-line-inactive
    :background bg-alt :foreground base7
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color base2)))

   ;; File-name
   (doom-modeline-project-dir :bold t :foreground cyan)
   (doom-modeline-buffer-path :inherit 'bold :foreground green)
   (doom-modeline-buffer-file :inherit 'bold :foreground fg)
   (doom-modeline-buffer-modified :inherit 'bold :foreground yellow)
   ;; Misc
   (doom-modeline-error :background bg)
   (doom-modeline-buffer-major-mode :foreground green :bold t)
   (doom-modeline-warning :foreground red :bold t)
   (doom-modeline-info :bold t :foreground cyan)
   (doom-modeline-bar :background dark-green)
   (doom-modeline-panel :background dark-green :foreground fg)

   ;;;;;;;; Search ;;;;;;;;
   ;; /find
   (isearch :foreground base0 :background orange)
   (evil-search-highlight-persist-highlight-face :background yellow)
   (lazy-highlight :background yellow :foreground base0 :distant-foreground base0 :bold bold)
   (evil-ex-substitute-replacement :foreground cyan :inherit 'evil-ex-substitute-matches)

   ;; evil-snipe
   (evil-snipe-first-match-face :foreground "white" :background yellow)
   (evil-snipe-matches-face     :foreground yellow :bold t :underline t)

   ;;;;;;;; Mini-buffers ;;;;;;;;
   (minibuffer-prompt :foreground cyan)
   (solaire-hl-line-face :background bg-alt2)

   ;; ivy
   (ivy-current-match :background bg-alt2)
   (ivy-subdir :background nil :foreground cyan)
   (ivy-action :background nil :foreground cyan)
   (ivy-grep-line-number :background nil :foreground cyan)
   (ivy-minibuffer-match-face-1 :background nil :foreground yellow)
   (ivy-minibuffer-match-face-2 :background nil :foreground yellow)
   (ivy-minibuffer-match-highlight :foreground cyan)
   (counsel-key-binding :foreground cyan)

   ;; swiper
   (swiper-line-face :background bg-alt2)

   ;; ivy-posframe
   (ivy-posframe :background bg-alt)
   (ivy-posframe-border :background base1)

   ;; neotree
   (neo-root-dir-face   :foreground cyan)
   (doom-neotree-dir-face :foreground cyan)
   (neo-dir-link-face   :foreground cyan)
   (doom-neotree-file-face :foreground fg)
   (doom-neotree-hidden-file-face :foreground (doom-lighten fg-alt 0.25))
   (doom-neotree-media-file-face :foreground (doom-lighten fg-alt 0.25))
   (neo-expand-btn-face :foreground magenta)

   ;; dired
   (dired-directory :foreground cyan)
   (dired-marked :foreground yellow)
   (dired-symlink :foreground cyan)
   (dired-header :foreground cyan)

   ;;;;;;;; Brackets ;;;;;;;;
   ;; Rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground red)
   (rainbow-delimiters-depth-2-face :foreground yellow)
   (rainbow-delimiters-depth-3-face :foreground cyan)
   (rainbow-delimiters-depth-4-face :foreground red)
   (rainbow-delimiters-depth-5-face :foreground yellow)
   (rainbow-delimiters-depth-6-face :foreground cyan)
   (rainbow-delimiters-depth-7-face :foreground red)
   ;; Bracket pairing
   ((show-paren-match &override) :foreground nil :background base5 :bold t)
   ((show-paren-mismatch &override) :foreground nil :background "red")

   ;;;;;;;; which-key ;;;;;;;;
   (which-func :foreground cyan)
   (which-key-command-description-face :foreground fg)
   (which-key-group-description-face :foreground (doom-lighten fg-alt 0.25))
   (which-key-local-map-description-face :foreground cyan)

   ;;;;;;;; Company ;;;;;;;;
   (company-preview-common :foreground cyan)
   (company-tooltip-common :foreground cyan)
   (company-tooltip-common-selection :foreground cyan)
   (company-tooltip-annotation :foreground cyan)
   (company-tooltip-annotation-selection :foreground cyan)
   (company-scrollbar-bg :background bg-alt)
   (company-scrollbar-fg :background cyan)
   (company-tooltip-selection :background bg-alt2)
   (company-tooltip-mouse :background bg-alt2 :foreground nil)

   ;;;;;;;; Misc ;;;;;;;;
   (+workspace-tab-selected-face :background dark-green :foreground "white")

   ;; Undo tree
   (undo-tree-visualizer-active-branch-face :foreground cyan)
   (undo-tree-visualizer-current-face :foreground yellow)

   ;; General UI
   (button :foreground cyan :underline t :bold t)

   ;; ediff
   (ediff-fine-diff-A    :background (doom-blend red bg 0.4) :weight 'bold)
   (ediff-current-diff-A :background (doom-blend red bg 0.2))

   ;; flycheck
   (flycheck-error   :underline `(:style wave :color ,red)    :background base3)
   (flycheck-warning :underline `(:style wave :color ,yellow) :background base3)
   (flycheck-info    :underline `(:style wave :color ,cyan)  :background base3)

   ;; helm
   (helm-swoop-target-line-face :foreground magenta :inverse-video t)
   (helm-ff-file-extension :foreground red)

   ;; magit
   (magit-section-heading             :foreground yellow :weight 'bold)
   (magit-branch-current              :underline cyan :inherit 'magit-branch-local)
   (magit-diff-hunk-heading           :background base3 :foreground fg-alt)
   (magit-diff-hunk-heading-highlight :background bg-alt2 :foreground fg)
   (magit-diff-context                :foreground bg-alt :foreground fg-alt)


   ;;;;;;;; Major mode faces ;;;;;;;;
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground keywords)

   ;; elisp-mode
   (highlight-quoted-symbol :foreground dark-cyan)

   ;; highlight-symbol
   (highlight-symbol-face :background (doom-lighten base3 0.03) :distant-foreground fg-alt)

   ;; highlight-thing
   (highlight-thing :background (doom-lighten base3 0.03) :distant-foreground fg-alt)

   ;; LaTeX-mode
   (font-latex-math-face :foreground dark-cyan)

   ;; markdown-mode
   (markdown-blockquote-face :inherit 'italic :foreground cyan)
   (markdown-list-face :foreground red)
   (markdown-url-face :foreground red)
   (markdown-pre-face  :foreground cyan)
   (markdown-link-face :inherit 'bold :foreground cyan)
   ((markdown-code-face &override) :background (doom-lighten base2 0.045))

   ;; mu4e-view
   (mu4e-header-key-face :foreground red)

   ;; org-mode
   ((outline-1 &override) :foreground yellow)
   ((outline-2 &override) :foreground cyan)
   ((outline-3 &override) :foreground cyan)
   (org-ellipsis :underline nil :foreground orange)
   (org-tag :foreground yellow :bold nil)
   ((org-quote &override) :inherit 'italic :foreground base7 :background org-quote)
   (org-todo :foreground yellow :bold 'inherit)
   (org-list-dt :foreground yellow)

   ;; web-mode
   (web-mode-html-tag-bracket-face :foreground blue)
   (web-mode-html-tag-face         :foreground cyan)
   (web-mode-html-attr-name-face   :foreground cyan)
   (web-mode-json-key-face         :foreground green)
   (web-mode-json-context-face     :foreground cyan)

   ;; FIX
   (alert-urgent-face :foreground red :weight 'bold)
   (aw-leading-char-face :foreground red)
   (breakpoint-enabled :foreground red :weight 'bold)
   (company-echo-common :foreground red)
   (cscope-line-number-face :foreground red)
   (cscope-separator-face :foreground red :overline t :underline t :weight 'bold)
   (dashbm-ff-suid :extend t :background red :foreground fg)
   (helm-separator :extend t :foreground red)
   (info-menu-star :foreground red)
   (js2-error :foreground red)
   (lsp-ui-doc-background :background nil)
   (magit-diff-file-heading-selection :background fg :foreground red :weight 'bold)
   (magit-header-line :background blue :foreground fg :weight 'bold)
   (neo-dir-link-face :height 94)
   (neo-file-link-face :height 94)
   (org-mode-line-clock-overrun :background red)
   (pyenv-active-python-face :foreground red :weight 'bold)
   (show-paren-mismatch :background red)
   (sp-show-pair-mismatch-face :background red)
   (sp-wrap-overlay-closing-pair :foreground red)
   (speedbar-selected-face :foreground red :underline t)
   (sunrise-clex-hotchar-face :foreground red :weight 'bold)
   (sunrise-editing-path-face :background red :foreground fg :weight 'bold)
   (sunrise-highlight-path-face :background blue :foreground fg :weight 'bold)
   (term-color-magenta :background red :foreground fg)
   (term-color-red :background red :foreground fg)
   (term-color-white :background cyan :foreground fg)
   (term-color-yellow :background green :foreground fg)
   (transient-amaranth :foreground red)
   (transient-blue :foreground blue)
   (transient-disabled-suffix :background red :foreground fg :weight 'bold)
   (transient-enabled-suffix :background cyan :foreground fg :weight 'bold)
   (transient-pink :foreground red)
   (transient-red :foreground red)


   )
  ;; --- extra variables --------------------


  ;; ()
  )
;;; motion-theme.el ends here
