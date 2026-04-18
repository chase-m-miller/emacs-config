;;;;;;;;;;;;;;;
;;; Options ;;;
;;;;;;;;;;;;;;;

;; Load 'custom-file'
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Disable menu bars and window decorations
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Make C code conform to the linux kernel style guide
(setq c-default-style "linux")

;; Don't use unicode symbols in the mode line (it increases load time)
(setq pdf-view-use-unicode-ligther nil)

;; Change yes/no prompts to y/n
(setopt use-short-answers t)

;; Increase files remembered by 'recentf'
(setq recentf-max-saved-items 50)
(setq recentf-max-menu-items 25)

;; Use S-<arrow> for windmove
(windmove-default-keybindings)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Enable/Load Packages ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Set up MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Enable various modes
(pdf-tools-install)   ;; PDF reader
(electric-pair-mode)  ;; Auto-complete pairs like "", {}, or ()
(windmove-mode)       ;; Switch windows with S-<arrowkey>
(recentf-mode)        ;; Open recent files
(fido-mode)           ;; Better ido-like completion

;; Load 'tetris' (Remove on non-Fedora systems)
(load "/usr/share/emacs/30.2/lisp/play/tetris.elc")

;; Load 'ace-jump-mode'
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

;;;;;;;;;;;;;;;;
;;; Keybinds ;;;
;;;;;;;;;;;;;;;;

(keymap-global-set "C-x C-r" 'recentf-open)
(keymap-global-set "C-c SPC" 'ace-jump-mode)
(keymap-global-set "C-x C-b" 'ibuffer)
(keymap-global-set "C-c w" 'visual-line-mode)

;;;;;;;;;;;;;;;;;;;;
;;; Mode Configs ;;;
;;;;;;;;;;;;;;;;;;;;

;; 'conf-mode'
(defun my-conf-setup ()
  "This function contains my conf-mode configurations."
  (keymap-local-set "C-c SPC" 'ace-jump-mode))

;; 'dired-mode'
(defun my-dired-setup ()
  "This function contains my dired-mode configurations."
  (keymap-local-set "C-c f" #'find-name-dired))

;;;;;;;;;;;;;
;;; Hooks ;;;
;;;;;;;;;;;;;

;; Add 'paredit-mode' to mode hooks
(add-hook 'geiser-mode-hook #'enable-paredit-mode)
(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)

;; Add my config functions to mode hooks
(add-hook 'conf-mode-hook #'my-conf-setup)
(add-hook 'dired-mode-hook #'my-dired-setup)
