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

; Named Function
(defun fib (n)
    (format t "Hello, Lisp!~%")
)


; Calling function
(fib 30)

; ~a is the placeholder for “print the argument” and ~% is for new line character
(format t "~a~%" (+ 2 2))     ; 4
(print "hello ...")
(print (+ 2 2))               ; 4
(print (- 50 (* 5 6)))        ; 20
(print (/ (- 50 (* 5 6)) 4))  ; 5
; division by default yields a ratio or a float if appropriate
(print (/ 8 5))               ; 8/5
(print (expt 5 2))            ; 25
(print (- (* 4 3.75) 1))      ; 14.0


;; VARIABLES
; In Common Lisp, you can define a variable with defparameter or
;       defvar (for globals) or let (for local variables).
;       Src: https://chatgpt.com/c/68f143bb-f794-8323-bc9e-678117cf14f1
; Learn: defparameter is most commonly used for globals you want to initialize every time.
(defparameter x 20)  ; x is now 20, can be changed
(print x) ; 20

(defvar x 30)        ; x is 20 if not already defined
(print x) ; 20

; Local variable (inside a block/function):
(print (let ((x 20)) x)) ; returns 20



; You cannot setf an undefined global variable directly. `setf` works
;       for existing variables or places.
;       src: https://chatgpt.com/c/68f143bb-f794-8323-bc9e-678117cf14f1
;; Define a global variable
(defparameter width nil)
(defparameter height nil)
(setf width 20)
(setf height (* 5 9))
(print (* width height))

; We can define multiple variables at once for local variables but
;       can't for global variables:
(let ((a 10) (b 20) (c 30))
    (print a) (print b) (print c) 
    ; ❤️ Learn: print only takes one argument, so you can’t directly do (print a b c).
    ;           but you can print them as list:
    (print (list a b c))
    ;           or using format:
    (format t "~%") ; for new line
    (format t "a=~a, b=~a, c=~a~%" a b c))

; Output:
; 10 
; 20 
; 30 
; (10 20 30) 

(defparameter squares nil)
(setf squares (list 1 4 9 16 25))
; (defvar squares (list 1 4 9 16 25))
(print squares)
; Output:
; (1 4 9 16 25)


; TODO Continue - Lists - https://lisp-docs.github.io/docs/tutorial/informal-introduction-to-lisp#13-lists