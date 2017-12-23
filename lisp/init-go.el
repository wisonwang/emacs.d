;; init go
;; https://github.com/dominikh/go-mode.el

(require 'go-mode)

;;; (require 'go-mode-autoloads)
(add-to-list 'yas-snippet-dirs "~/.emacs.d/snippets/go-mode/")

(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)

(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)

;;; https://github.com/purcell/exec-path-from-shell

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(exec-path-from-shell-copy-env "GOPATH")

(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))

(require 'golint)
(provide 'init-go)

;;; https://github.com/nsf/gocode

(add-to-list
 'load-path (concat
             (getenv "GOPATH")
             "/src/github.com/nsf/gocode/emacs"))

(require 'gotest)
(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

