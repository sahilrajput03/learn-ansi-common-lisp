; Source: https://chatgpt.com/c/69e2110a-2250-83e8-a567-948f6f399eea

(defmacro say-hi () '(print "Hi Sahil."))
(say-hi)

; In Common Lisp, the , (comma) is used inside a backquoted expression (`).
;   It means: Don’t treat it as literal code, rather “evaluate this part i.e,
;   inject actual value.

; With , (inject actual value)
(defmacro demo1 (x) `(print ,x))
(demo1 5); 5
; Above would expand to: (print 5)   ;; correct ✅

; Without , (treat as literal code)
(defparameter x 20)  ; Setting global variable x to 20
(defmacro demo2 (x) `(print x))
(demo2 5); 20 (Prints 20 because x is 20 in global scopre);
; Learn: If x was not defined in global scope then it throws - `The variable X
;        is unbound.` because macro would expand it to: (print x) ; i.e, x is
;        NOT replaced as it’s treated as literal code, and it looks for variable
;        x in the scope of execution and not finding it, throws error.


(print "----------")

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

