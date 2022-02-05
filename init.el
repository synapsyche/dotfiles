;; Initialize Package Sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("elpa" . "https://elpa.gnu.org/packages/"))
      inhibit-startup-screen t
      visible-bell t
      make-pointer-invisible t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Full screen for emacsclient
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Exempt term mode frrom globl lines
(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes
  '(term-mode)
  "Major modes on which to disable line numbers."
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "Turn on line numbers except for certain major modes.
Exempt major modes are defined in `display-line-numbers-exempt-modes'."
  (unless (or (minibufferp)
	      (member major-mode display-line-numbers-exempt-modes))
    (display-line-numbers-mode)))
(global-display-line-numbers-mode)


(display-time-mode 1)

(load-theme 'tango-dark t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(emms lsp-mode elixir-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Function: capitalize highlighted word
(defun my_capitalize-word()
  "My Modified capitalize-word"
  (interactive)
  (capitalize word 1)
  )
(global-set-key (kbd "M-c") 'my_capitalize-word)
