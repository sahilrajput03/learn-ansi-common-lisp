; Using print (adds a newline before printing automatically):
(print "Hello Sahil.")

; Using format gives us more control while printing to console:
; The ~% in the end is for new line character.
; `t` specifies destination (prints to console).
; ~% is for new line character
(format t "Hello, Lisp!~%")

; Single line comments start with a semicolon, and can start at any point in the line

#|
  This is a multi-line comment.

  #|
    They can be nested!
  |#
|#