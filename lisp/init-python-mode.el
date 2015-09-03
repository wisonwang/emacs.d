(autoload 'doctest-mode "doctest-mode" "Python doctest editing mode." t)

(setq interpreter-mode-alist
      (cons '("python" . python-mode) interpreter-mode-alist))

(defun python-mode-hook-setup ()
  (unless (is-buffer-file-temp)
    ;; run command `pip install jedi flake8 importmagic` in shell,
    ;; or just check https://github.com/jorgenschaefer/elpy
    (elpy-mode 1)
    ;; http://emacs.stackexchange.com/questions/3322/python-auto-indent-problem/3338#3338
    ;; emacs 24.4 only
    (setq electric-indent-chars (delq ?: electric-indent-chars))
    ))

<<<<<<< 254578d85f74204460c74a1ac2d4935c8dc18f24
(add-hook 'python-mode-hook 'python-mode-hook-setup)
=======
;;----------------------------------------------------------------------------
;; On-the-fly syntax checking via flymake
;;----------------------------------------------------------------------------
(eval-after-load 'python
  '(require 'flymake-python-pyflakes))

(add-hook 'python-mode-hook '(lambda ()
                               (unless (is-buffer-file-temp)
                                 (message "python-mode-hook called")
                                 (when *emacs24*
                                   (anaconda-mode)
                                   (add-to-list 'company-backends 'company-anaconda)
                                   (eldoc-mode))
                                 (flymake-python-pyflakes-load)
                                 )))
>>>>>>> add python env package

(provide 'init-python-mode)
