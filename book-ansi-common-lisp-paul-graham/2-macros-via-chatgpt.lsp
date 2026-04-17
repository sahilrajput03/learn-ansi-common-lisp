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
(defmacro demo2 (x) `(print x))
; (demo2 5) ; Throws - `The variable X is unbound.`
; Above would expand to:
; (print x); x is NOT replaced → wrong ❌

(print "----------")

; `progn` stands for PROGram + N (historically meaning “sequence”)
; It means do these things one by one, and give me the last result.”
; Example:
(print (progn (+ 1 2) (+ 3 4))); 7

; Learn: Macros don’t run values — they generate code before execution.
(defmacro print-and-return (x) `(progn (print ,x) ,x))

(print-and-return 5)
#|  Macro expands to below before execution:
(progn (print 5) 5)
|#

