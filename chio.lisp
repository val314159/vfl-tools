(in-package :vfl-tools)
(defconstant NL #\Newline)
(defvar *nl-pos*)
(defun   snl (s c) (if (eq c NL) (setf *nl-pos* (p s))) c)
(defun   off (s) (- (p s) *nl-pos*))
(defun peekc (s) (peek-char nil s nil))
(defun readc (s) (snl s (read-char s)))
(defun readr (s) (read-preserving-whitespace s))
(set-macro-character NL λ(n (snl $1 $2)
			    (values)))
