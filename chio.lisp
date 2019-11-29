(in-package :vfl-tools)
(defconstant   VT #\Vt)
(defconstant   TB #\Tab)
(defconstant   FF #\Page)
(defconstant   SP #\Space)
(defconstant   CR #\Return)
(defconstant   NL #\Newline)
(defparameter  WC '(VT TB FF SP CR))
(defparameter EOS '(#\¶ #\§ nil))
(defvar *nl-pos*)
(defun   snl (s c) (if (eq c NL) (setf *nl-pos* (p s))) c)
(defun   off (s) (- (p s) *nl-pos*))
(defun peekc (s) (peek-char nil s nil))
(defun readc (s) (snl s (read-char s)))
(defun readr (s) (read-preserving-whitespace s))
(defun sym-p (c) (mv-bind (a b) (get-mchar c) (if a b t)))
(defun read-wc (s) (if (member (peekc s) WC) (cons (readc s) (read-wc s))))
(defun read-ws (s) (if (member (peekc s) WS) (cons (readc s) (read-ws s))))
(set-mchar NL  λ(n (snl $1 $2) (^)))
(set-mchar VT  λ(^))
(set-mchar TB  λ(^))
(set-mchar FF  λ(^))
(set-mchar SP  λ(^))
(set-mchar CR  λ(^))
(set-mchar #\¶ λ(^))
(set-mchar #\( λ(read-delimited-list #\) $1))
