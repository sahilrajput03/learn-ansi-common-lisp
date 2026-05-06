(print "❤️ Running program:")
; Learn: Even though we catch runtime expections but we still get compile time warning for below.

; Learn: `handler-case` cannot catch compile-time errors — it only works for runtime conditions.


(handler-case (eval '(print myVariable))
    (error (c) (format t "~%Caught error: ~a~%" c)));
;     ; Output: Caught error: The variable MYVARIABLE is unbound.

; ;; Test for unbound variable
; Learn: The error (unbound-variable) happens at runtime, when Lisp
;         tries to evaluate it 👉 So handler-case catches it.
(handler-case (print myVariable)
  (unbound-variable (c) (format t "~%🔴Caught unbound variable: ~a~%" c)))
;     ; 🔴Caught unbound variable: The variable MYVARIABLE is unbound.

; ----------------------------------------------------

; ;; Test for illegal function call with string
; Learn: ❌ ❌ Throws compile time error because - ("Hello common lisp") is
;        invalid → Lisp treats it as a function call But "Hello common
;        lisp" is not a function.
; (handler-case (print ("Hello common lisp"))
;   (undefined-function (c) (format t "🔴Caught undefined function: ~a~%" c)))
; 💥 💥 💥  Program exits here at runtime. 💥 💥 💥  

; Learn: '(print ("Hello common lisp")) is data, not code.
;           So the compiler does not inspect it. The error happens at
;           runtime inside eval, and handler-case can catch it.
(handler-case (eval '(print ("Hello common lisp")))
  (error (c)
    (format t "~%🔴Caught error: ~a~%" c)))
    ; Output: Caught error: Execution of a form compiled with errors.
    ; Form:
    ;   ("Hello common lisp")
    ; Compile-time error:
    ;   illegal function call

; ----------------------------------------------------

;; Test for illegal function call with number
; Learn: ❌ ❌ Throws compile time error because - (123) is
;        invalid → Lisp treats it as a function call But "123"
;       is not a function.
; (handler-case (print (123))
;   (undefined-function (c) (format t "Caught undefined function: ~a~%" c)))
; 💥 💥 💥  Program exits here at runtime. 💥 💥 💥  
