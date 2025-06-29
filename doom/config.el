;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;; user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - doom-font' -- the primary font to use
;; - doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - doom-big-font' -- used for doom-big-font-mode'; use this for
;; presentations or streaming.
;; - doom-symbol-font' -- for symbols
;; - doom-serif-font' -- for the fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;; doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set doom-theme' or manually load a theme with the
;; load-theme' function. This is the default:
(setq doom-theme 'doom-moonlight)
;; (setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to nil', line
;; numbers are disabled. For relative line numbers, set this to relative'.
(setq display-line-numbers-type 'relative)

;; If you use org' and don't want your org files in the default location below,
;; change org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;; (after! PACKAGE
;; (setq x y))
;;
;; The exceptions to this rule:
;;
;; - Setting file/directory variables (like org-directory')
;; - Setting variables which explicitly tell you to set them before their
;; package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;; - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - load!' for loading external *.el files relative to this one
;; - use-package!' for configuring packages
;; - after!' for running code after a package has loaded
;; - add-load-path!' for adding directories to the load-path', relative to
;; this file. Emacs searches the load-path' when you load packages with
;; require' or use-package'.
;; - map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Unmaps
;; C-j creating newline and C-k deleting rest of line is very annoying
(map! :g
      "C-k" nil
      "C-j" nil)

(map! :nv "L" #'evil-last-non-blank)
(map! :nv "H" #'evil-first-non-blank)
(map! :leader :n :desc "Save buffer" "w" #'save-buffer)
(map! :desc "Quit buffer" :leader :n "q" #'evil-quit)

;; Override which-key descriptions here
(after! which-key
  (push '(("\`SPC w\'") nil . "Save buffer") which-key-replacement-alist)
  (push '(("\`SPC q\'") nil . "Quit buffer") which-key-replacement-alist)
  )

(load! "repeatable-resize")

;;(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 12 :weight 'semi-light)
;; doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;; JetBrainsMonoNL Nerd Font Mono
(setq doom-font (font-spec :family "JetBrainsMonoNL Nerd Font Mono" :size 24))

;; Enable treesitter
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(after! corfu
  (setq corfu-auto-delay 0.01)
  (setq corfu-auto-prefix 1))

;; LSP
(use-package! lsp-mode
  :custom
  (lsp-restart nil)
  (lsp-log-io nil)
  (lsp-auto-guess-root nil)
  (lsp-enable-links nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-modeline-code-actions-enable nil)
  ;; (lsp-modeline-diagnostics-enable nil)
  ;; lsp-headerline-breadcrumb-enable t)
  (lsp-semantic-tokens-enable nil)
  ;; lsp-enable-folding nil)
  ;; lsp-enable-imenu nil)
  (lsp-enable-snippet nil)
  (lsp-ui-sideline-mode nil)
  (lsp-ui-sideline-show-diagnostics nil)
  (lsp-completion-show-kind t)
  (lsp-completion-show-detail t)
  (lsp-signature-render-documentation nil)
  (lsp-lens-enable t)
  (lsp-inlay-hint-enable nil)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-show-with-cursor nil)
  (lsp-ui-doc-show-with-mouse 't)
  (lsp-enable-symbol-highlighting nil)
  ;; (lsp-headerline-breadcrumb-enable t)
  ;; (lsp-headerline-breadcrumb-segments '(project file symbols))
  (lsp-use-plists t)
  (lsp-enable-file-watchers nil)
  (read-process-output-max (* 8 1024 1024)) ;; 3MB)
  (lsp-idle-delay 0.010)
  (lsp-completion-provider :none)
  ;; (lsp-diagnostics-provider :flymake)
  (lsp-disabled-clients '(vue-semantic-server volar-api volar-html volar-doc semgrep-ls emmet-ls))
  (lsp-eldoc-enable-hover nil)

  :init
  (defun lsp-booster--advice-json-parse (old-fn &rest args)
    "Try to parse bytecode instead of json."
    (or
     (when (equal (following-char) ?#)
       (let ((bytecode (read (current-buffer))))
         (when (byte-code-function-p bytecode)
           (funcall bytecode))))
     (apply old-fn args)))
  (advice-add (if (progn (require 'json)
                         (fboundp 'json-parse-buffer))
                  'json-parse-buffer
                'json-read)
              :around
              #'lsp-booster--advice-json-parse)

  (defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
    "Prepend emacs-lsp-booster command to lsp CMD."
    (let ((orig-result (funcall old-fn cmd test?)))
      (if (and (not test?) ;; for check lsp-server-present?
               (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
               lsp-use-plists
               (not (functionp 'json-rpc-connection)) ;; native json-rpc
               (executable-find "emacs-lsp-booster"))
          (progn
            (when-let ((command-from-exec-path (executable-find (car orig-result)))) ;; resolve command from exec-path (in case not found in $PATH)
              (setcar orig-result command-from-exec-path))
            (message "Using emacs-lsp-booster for %s!" orig-result)
            (cons "emacs-lsp-booster" orig-result))
        orig-result)))
  (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)
  )

(after! lsp-ui
  (setq lsp-ui-doc-enable t))

(custom-set-faces
 '(tree-sitter-hl-face:property ((t (:inherit font-lock-constant-face)))))

