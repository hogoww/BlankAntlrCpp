#!/usr/bin/emacs --script

(setq require-final-newline 'visit)

(defun indent-file (file)
  (if (not (eq "" file))
      (progn
	(find-file file)
	(print file)
	(indent-region (point-min) (point-max))
	(save-buffer)
	(kill-buffer))
    (princ "you didn't give any file to treat\n"))
  )


(indent-file (car command-line-args-left))


