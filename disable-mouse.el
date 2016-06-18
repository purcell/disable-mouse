;;; disable-mouse.el --- Disable mouse commands globally  -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Steve Purcell

;; Author: Steve Purcell <steve@sanityinc.com>
;; Keywords: mouse

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides `disable-mouse-mode', a global mode which suppresses all
;; mouse events by intercepting them and running a customisable
;; handler command (`ignore' by default).

;;; Code:

(defgroup disable-mouse nil
  "Disable mouse commands globally."
  :prefix "disable-mouse-"
  :group 'mouse)

(defcustom disable-mouse-command 'ignore
  "The command to run when a mouse action is attempted."
  :group 'disable-mouse
  :type 'function)

(defconst disable-mouse--bindings-modifier-combos
  '(nil "C-" "M-" "S-" "C-M-" "C-S-" "M-S-" "M-C-S-"))

(defconst disable-mouse--bindings-targets '(nil "bottom-divider" "vertical-line"))

(defconst disable-mouse--multipliers '(nil "double" "triple"))

(defconst disable-mouse--bindings
  '("mouse-1" "mouse-2" "mouse-3"
    "up-mouse-1" "up-mouse-2" "up-mouse-3"
    "down-mouse-1" "down-mouse-2" "down-mouse-3"
    "wheel-up" "wheel-down" "wheel-left" "wheel-right"
    ))

(defun disable-mouse--all-bindings ()
  "Return an extensive list of mouse-related keybindings."
  (let ((bindings))
    (dolist (target disable-mouse--bindings-targets)
      (dolist (mod disable-mouse--bindings-modifier-combos)
        (dolist (mult disable-mouse--multipliers)
          (dolist (binding disable-mouse--bindings)
            (push (read-kbd-macro
                   (concat (when target (concat "<" target "> "))
                           mod
                           "<"
                           (when mult (concat mult "-"))
                           binding
                           ">"))
                  bindings)))))
    bindings))

(defun disable-mouse--handle ()
  "Handle when a disabled mouse event is fired."
  (interactive)
  (call-interactively disable-mouse-command))

(defvar disable-mouse-mode-map
  (let ((map (make-sparse-keymap)))
    (dolist (binding (disable-mouse--all-bindings))
      (define-key map binding 'disable-mouse--handle))
    map)
  "Map containing no-op bindings for all mouse events.")

;;;###autoload
(define-minor-mode disable-mouse-mode
  "Disable the mouse globally."
  nil
  :lighter " NoMouse"
  :global t)


(provide 'disable-mouse)
;;; disable-mouse.el ends here
