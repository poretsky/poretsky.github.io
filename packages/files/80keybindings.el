;;; Key customizations.

(require 'cl)

;; Unbind C-z to shell instead of suspend-emacs (it is too easy to press C-z and hence suspending Emacspeak).
;; Rather use C-z C-z to suspend emacs
(global-unset-key "\C-z")
(global-unset-key "\C-x\C-z")

;; Global key bindings
(loop for binding in 
      '(
        ;; Extra navigation keys
        ([home] . beginning-of-line)
        ([end] . end-of-line)
        ([?\e home] . beginning-of-buffer)
        ([?\e end] . end-of-buffer)
        ("\C-xg" . goto-line)

        ;; Function keys
        ([f1] . help-for-help)
        ([f2] . save-buffer)
        ([f3] . find-file)
        ([f4] . switch-to-buffer)
        ([f5] . delete-other-windows)
        ([f6] . delete-window)
        ([f7] . grep)
        ([f8] . kill-buffer)
        ([f9] . compile)
        ;; F10 is already bound to menu natively
        ([f11] . bbdb)
        ([f12] . other-window)

        ;; Shifted function keys
        ([f13] . gnus)
        ([S-f3] . gnus)
        ([f14] . shell)
        ([S-f4] . shell)
        ([f15] . dictionary-search)
        ([S-f5] . dictionary-search)
        ([f16] . w3m)
        ([S-f6] . w3m)
        ([f17] . find-grep-dired)
        ([S-f7] . find-grep-dired)
        ([f18] . server-start)
        ([S-f8] . server-start)

        ;; Function keys prefixed by ESC
        ([?\e f3] . debian-bug)
        ([?\e f4] . apt-utils-show-package)
        ([?\e f5] . apt-utils-search)
        ([?\e f7] . find-name-dired)

        ;; Other key sequences for convenience
        ("\C-z\C-z" . suspend-emacs)
        ("\C-xy" . insert-register)
        )
      do
      (global-set-key (car binding) (cdr binding)))

;; Debian specific tools menu
(when (featurep 'debian-el)
  (setq debian-menu (make-sparse-keymap "DEBIAN"))
  (define-key global-map [menu-bar tools DEBIAN]
    (cons "Debian" debian-menu))
  (define-key global-map [menu-bar tools DEBIAN reportbug]
    '("Send bug report" . debian-bug))
  (define-key global-map [menu-bar tools DEBIAN aptsearch]
    '("Search package" . apt-utils-search))
  (define-key global-map [menu-bar tools DEBIAN aptshow]
    '("Show package info" . apt-utils-show-package)))
