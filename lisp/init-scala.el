
;;We have "sbt" and "scala" in /usr/local/bin so we add this path to the PATH environment
(setq exec-path (append exec-path '("/usr/local/bin")))
(setq exec-path (append exec-path '("/usr/local/sbin")))
(setenv "PATH" (shell-command-to-string "/bin/bash -c 'echo -n $PATH'"))

(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
(provide 'init-scala)