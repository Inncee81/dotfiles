;;;; flymake setting

;; flycheck
(require 'flycheck)
(setq flycheck-mode-line-lighter " fc") ; defined by defconst in flycheck.el

(custom-set-variables '(flycheck-display-errors-delay 0.5)
                      '(flycheck-disabled-checkers '(
                                                     emacs-lisp-checkdoc
                                                     )))

(defvar my/flycheck-enable-modes '(
                                   emacs-lisp-mode
                                   enh-ruby-mode
                                   js2-mode
                                   ruby-mode
                                   ))

(dolist (mode my/flycheck-enable-modes)
  (add-hook (intern (format "%s-hook" mode)) 'flycheck-mode))
