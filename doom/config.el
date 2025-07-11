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

(setq org-agenda-files (directory-files-recursively "~/org/" "\\.org$"))


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

(after! evil-escape
  (setq evil-escape-key-sequence "jk"))

;; Unmaps

(map! :g
      ;; C-j creating newline and C-k deleting rest of line is very annoying
      "C-k" nil
      "C-j" nil
      ;; GNU warranty shortcut
      "C-h C-w" nil
      )

(map! :gnivm
      ;; Creates a newline
      "C-<return>" nil
      "C-RET" nil)


(map! :n "C-a" #'evil-numbers/inc-at-pt-incremental)
(map! :n "C-x" #'evil-numbers/dec-at-pt-incremental)

(map! :nv "L" #'evil-last-non-blank)
(map! :nv "H" #'evil-first-non-blank)
(map! :leader :n :desc "Save buffer" "w" #'save-buffer)
(map! :desc "Quit buffer" :leader :n "q" #'evil-quit)
(map! :nviemg "C-n" #'+treemacs/toggle)
(map! :leader
      :prefix "p"
      :desc "Search project"
      "g" #'+default/search-project)
(map! :n "g r" #'+lookup/references)
(map! :leader :n "f o" #'dired-jump)

(map! :leader :n "TAB h" '+workspace/switch-left)
(map! :leader :n "TAB l" '+workspace/switch-right)

;; Harpoon
(map! :leader :n "h h" 'harpoon-toggle-quick-menu)
(map! :leader :n "h a" 'harpoon-add-file)
(map! :leader :n "h D" 'harpoon-clear)
(map! :leader :n "h 1" 'harpoon-go-to-1)
(map! :leader :n "h 2" 'harpoon-go-to-2)
(map! :leader :n "h 3" 'harpoon-go-to-3)
(map! :leader :n "h 4" 'harpoon-go-to-4)

(load! "repeatable-resize")

;;(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 12 :weight 'semi-light)
;; doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;; JetBrainsMonoNL Nerd Font Mono
(setq doom-font (font-spec :family "JetBrainsMonoNL Nerd Font Mono" :size 24))

;; Enable treesitter
(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(after! corfu
  (setq corfu-auto-delay 0.001)
  (setq corfu-auto-prefix 1)
  (setq corfu-preview-current nil)
  (setq corfu-preselect 'first))

(after! corfu-popupinfo
  (setq corfu-popupinfo-delay '(0.3 . 0.2)))

(after! company
  (setq company-idle-delay 0.001))

;; LSP
(setq global-eldoc-mode nil)

(after! lsp-mode
  (setq lsp-eldoc-enable-hover nil)
  (setq lsp-enable-file-watchers nil)
  (setq lsp-enable-links nil)
  (setq lsp-use-plists t)

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
      (if (and (not test?)                             ;; for check lsp-server-present?
               (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
               lsp-use-plists
               (not (functionp 'json-rpc-connection))  ;; native json-rpc
               (executable-find "emacs-lsp-booster"))
          (progn
            (when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
              (setcar orig-result command-from-exec-path))
            (message "Using emacs-lsp-booster for %s!" orig-result)
            (cons "emacs-lsp-booster" orig-result))
        orig-result)))
  (advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)
  )


(custom-set-faces
 '(tree-sitter-hl-face:property ((t (:inherit font-lock-constant-face)))))
