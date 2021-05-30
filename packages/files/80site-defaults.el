;;; Common Emacs configuration

;; Load additional modules
(require 'dired-x nil t)
(require 'saveplace nil t)

;; Remember places
(setq-default save-place t)

;; Show archives content smartly
(auto-compression-mode t)

;; Highlight mark and search operations
(setq-default transient-mark-mode       t)
(setq search-highlight                  t)

;; Suppress backups
(setq make-backup-files nil)

;; Compilation process
(setq compilation-ask-about-save        nil)
(setq compile-command "make -ks ")

;; Display the time on modeline
(display-time)

;; This is to not display the initial message (which says to a novice
;; user what to do first if he/she is confused).
(setq inhibit-startup-message t)

;; This disables down-arrow and C-n at the end of a buffer from adding
;; a new line to that buffer.
(setq next-line-add-newlines nil)

;; This makes `apropos' and `super-apropos' do everything that they can.
(setq apropos-do-all t)

;; Automatically makes the matching paren stand out in color.
(show-paren-mode t)

;; This moves the mouse pointer out of my way when I type.
(mouse-avoidance-mode 'banish)

;; Enable some commands we need.
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; Don't use tabs by default
(setq-default indent-tabs-mode nil)

;; Comprehensively decorate buffers content
(global-font-lock-mode t)

;; Autofill text buffers
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; For Emacspeak
(setq-default emacspeak-use-auditory-icons t)

;; For Russian language
(require 'cyrillic)
