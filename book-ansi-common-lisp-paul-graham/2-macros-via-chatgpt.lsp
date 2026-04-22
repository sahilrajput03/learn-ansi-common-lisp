; Source (1): https://chatgpt.com/c/69e2110a-2250-83e8-a567-948f6f399eea
; Source (2): https://chatgpt.com/c/69e85f82-8e6c-83e8-ac67-ea247b282b29

; Essentials:
;   Macro → transforms code
;   Quote → “don’t evaluate this”
;   Backquote → “template this code”

(defmacro say-hi () '(print "Hi Sahil with quote operator."))
(say-hi) ; "Hi Sahil with quote operator." 

; Macro that just runs code (no syntax transformation)
; - Here we are not constructing code we are simply executing a fixed form.
; - This marco is just for demonstration purpose, this should be a function, not a macro.
(defmacro say-hi () (print "Hi Sahil, without quote operator."))
(say-hi) ; "Hi Sahil, without quote operator." 

(print "---------- 1")

; Learn: `input-body` is just a name, you can call it anything though
;        it’s a convention to use `body` instead of `input-body`. I
;        used it to make it more clear that it’s the body of code that
;        we are passing to macro.
(defmacro my-when (condition &body input-body)
  `(if ,condition
       (progn ,@input-body)))

(my-when (> 10 5)
  (print "Yes, 10 is")
  (print "greater than 5"))
; Yes, 10 is
; greater than 5

(print "---------- 2")

; Usage with two body
(defmacro my-if (condition &body input-body)
  (let ((my-first-body (first input-body))
        (my-second-body (second input-body)))
    `(if ,condition
         ,my-first-body
         ,my-second-body)))
(my-if (> 10 5)
  (print "YES")
  (print "NO"))

; In Common Lisp, the , (comma) is used inside a backquoted expression (`).
;   It means: Don’t treat it as literal code, rather “evaluate this part i.e,
;   inject actual value.
;  1. With , (inject actual value)
(defmacro demo1 (x) `(print ,x))
(demo1 5); 5
; Above would expand to: (print 5)   ;; correct ✅

;  2. Without , (treat as literal code)
(defparameter x 20)  ; Setting global variable x to 20
(defmacro demo2 (x) `(print x))
(demo2 5); 20 (Prints 20 because x is 20 in global scopre);
; Learn: If x was not defined in global scope then it throws - `The variable X
;        is unbound.` because macro would expand it to: (print x) ; i.e, x is
;        NOT replaced as it’s treated as literal code, and it looks for variable
;        x in the scope of execution and not finding it, throws error.


(print "---------- 3")

; `progn` stands for PROGram + N (historically meaning “sequence”)
; It means do these things one by one, and give me the last result.”
; Example:
(print (progn (+ 1 2) (+ 25 5))); 30

; Learn: Macros don’t run values — they generate code before execution.
(defmacro print-and-return (x) `(progn (print ,x) ,x))

(print(print-and-return 5))
; Output:
; 5
; 5
#|  Above macro expands to below before execution:
(progn (print 5) 5)
|#

