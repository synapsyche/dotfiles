;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Initialize Package Sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Stop Gnu Emacs startup screen
(setq inhibit-startup-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(cua-rectangle-mark-key (kbd "<C-S-return>"))
 '(cursor-type t)
 '(custom-enabled-themes '(tango-dark))
 '(display-time-mode t)
 '(face-font-family-alternatives
   '(("arial black" "arial" "DejaVu Sans")
     ("arial" "DejaVu Sans")
     ("courier" "Monospace")
     ("monaco" "Monospace")
     ("xiki" "verdana")
     ("verdana" "DejaVu Sans")))
 '(font-lock-keywords-case-fold-search t t)
 '(fringe-mode 0 nil (fringe))
 '(global-font-lock-mode t nil (font-lock))
 '(menu-bar-mode -1)
 '(scroll-bar-mode nil)
 '(show-paren-mode 1)
 '(tabbar-mode nil)
 '(tool-bar-mode nil))
	;; remove toolbar

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 83 :width normal)))))

;; Function to realign tabs in current buffer
;; M-x iwb
(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max))
  )

(setq show-paren-delay 0)
;;Change color and font of parentheses
(require 'paren)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-foreground 'show-paren-match "red")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;; when matching is offscreen show line number in minibuffer
(defadvice show-paren-function
    (after show-matching-paren-offscreen activate)
  "If the matching paren is offscreen, show the matching line in the
        echo area. Has no effect if the character before point is not of
        the syntax class ')'."
  (interactive)
  (let* ((cb (char-before (point)))
         (matching-text (and cb
                             (char-equal (char-syntax cb) ?\) )
                             (blink-matching-open))))
    (when matching-text (message matching-text)))
  )

;; Function: capitalize highlighted word
(defun my_capitalize-word()
  "My Modified capitalize-word"
  (interactive)
  (capitalize-word 1)
  )
(global-set-key (kbd "M-c") 'my_capitalize-word)
