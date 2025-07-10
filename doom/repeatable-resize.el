;;; repeatable-resize.el --- Repeatable window resize -*- lexical-binding: t; -*-

;;; Commentary:
;; After `C-w <` or `C-w >`, subsequent `<` or `>` presses within 1s will
;; continue to resize the window.

;;; Code:
(defvar repeatable-resize-timeout 0.5 "Amount of seconds to wait before exiting the resize mode.")

(defun +my/repeatable-shrink-window-horizontally ()
  "Repeatable shrink window horizontally."
  (interactive)
  (shrink-window-horizontally 10)
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "<") #'+my/repeatable-shrink-window-horizontally)
     (define-key map (kbd ">") #'+my/repeatable-enlarge-window-horizontally)
     map)
   nil
   nil
   nil
   repeatable-resize-timeout))

(defun +my/repeatable-enlarge-window-horizontally ()
  "Repeatable enlarge window horizontally."
  (interactive)
  (enlarge-window-horizontally 10)
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "<") #'+my/repeatable-shrink-window-horizontally)
     (define-key map (kbd ">") #'+my/repeatable-enlarge-window-horizontally)
     map)
   nil
   nil
   nil
   repeatable-resize-timeout))

(defun +my/repeatable-increase-window-height ()
  "Repeatable enlarge window vertically."
  (interactive)
  (evil-window-increase-height 5)
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "-") #'+my/repeatable-decrease-window-height)
     (define-key map (kbd "+") #'+my/repeatable-increase-window-height)
     map)
   nil
   nil
   nil
   repeatable-resize-timeout))

(defun +my/repeatable-decrease-window-height ()
  "Repeatable enlarge window vertically."
  (interactive)
  (evil-window-decrease-height 5)
  (set-transient-map
   (let ((map (make-sparse-keymap)))
     (define-key map (kbd "-") #'+my/repeatable-decrease-window-height)
     (define-key map (kbd "+") #'+my/repeatable-increase-window-height)
     map)
   nil
   nil
   nil
   repeatable-resize-timeout))

(map! :prefix "C-w"
      :n "<" #'+my/repeatable-shrink-window-horizontally
      :n ">" #'+my/repeatable-enlarge-window-horizontally
      :n "+" #'+my/repeatable-increase-window-height
      :n "-" #'+my/repeatable-decrease-window-height)

(provide 'repeatable-resize)
;;; repeatable-resize.el ends here
