;;; helm-frame.el --- open helm buffers in a dedicated frame

;; copyright © 2017 chee
;; author: chee <chee@snake.dog>
;; keywords: lisp, helm, popup, frame
;; version: 0.4.7

;; this program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; commentary:

;; to configure, (require 'helm-frame) and add lines like these to your init:
;;
;;   (add-hook 'helm-after-action-hook '@helm-frame/delete)
;;   (add-hook 'helm-cleanup-hook '@helm-frame/delete)
;;   (setq helm-split-window-preferred-function '@helm-frame/window)

;;; code:

(defun @helm-frame/create ()
  (let
    ((old-frame (window-frame))
      (frame (make-frame '((name . "Helm") (width . 80) (height . 20)))))
    (set-frame-width frame 80)
    (set-frame-height frame 20)
    (center-frame frame)
    (lower-frame frame)
    (select-frame-set-input-focus old-frame) frame))

(defun @helm-frame/frame ()
  (let ((frame (or (frame-named "Helm") (@helm-frame/create))))
    (set-frame-width frame 80)
    (set-frame-height frame 20)
    (center-frame frame)
    frame))

(defun @helm-frame/window (window)
  (frame-root-window (@helm-frame/frame)))

(defun @helm-frame/delete ()
  (delete-frame (@helm-frame/frame)))

(provide 'helm-frame)
