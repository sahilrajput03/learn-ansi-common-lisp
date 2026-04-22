; A simple comment.
(print "Hello common lisp"); "Hello common lisp"
(print 123); 123
; Function definition & Funciton call
; `lowercase-with-dashes` is the standard convention for naming functions in Common Lisp.
(defun add-numbers (a b) (+ a b))
(print (add-numbers 60 10))     ; 70

; Below statement works even though there is space b/w `print` and `(..)` but:
;   ❌ It is stylistically wrong
;   ❌ It violates standard Lisp formatting conventions
;   ❌ It reduces readability
;   ❌ It looks like C/Java-style function syntax, which Lisp avoids
;      👉🏻 So please avoid this style. Lisp thinking model - Everything is
;         a list, and spacing is irrelevant—but structure clarity matters
;         for humans.
(print(add-numbers 60 10))      ; 70

; TODO: Add real code test for below exeptions:
; (print myVariable);               Throws exception - The variable MYVARIABLE is unbound.
; (print ("Hello common lisp"));    Throws exception - "illegal function call"
; (print (123));                    Throws exception - "illegal function call"

; Prefix Notation: Here, + is called the operator, and the numbers 2 and 3 are
;   called the arguments.

; These are valid Lisp expressions:
; 2         (+2 3)          (+2 3 4)        (/ (- 7 1) ( - 4 2))

; In Lisp, + is a function, and an expression like (+ 2 3) is a function call.

(print(+ 2 3)); 5
(print (+ 2 3 4)); 9
(print (/ (- 7 1) (- 4 2))); 3

(print +); NIL
(print (+)); 0
(print (+ 2)); 2


; pg. 9 (26)
; As we will see, all Lisp code takes this form. A language like C has a
;   more complicated syntax: arithmetic expressions use infix notation; function
;   calls use a sort of prefix notation, with the arguments delimited by commas;
;   expressions are delimited by semicolons; and blocks of code are delimited by
;   curly brackets. In Lisp, we use a single notation to express all these ideas.


; quote operator: It does nothing. It is a way of protecting expressions from
;   evaluation.
(print (quote (+ 3 5))); (+ 3 5)
; ✅ In below line, ' is an abbreviation (syntax sugar) for quote operator and we
;   can use it by affixing any expression with a single quote i.e, '.
(print '(+ 3 5)); (+ 3 5)


; Data Types - integers, strings, symbols, lists
;   Both integers and stirngs evaluates to themselves
;   Symbols are words, ordinarily they are converted to uppercase, regardless of
;       how you type them.
(print 'Artichoke); ARTICHOKE
;   Symbols do not (usually) evaluate to themselves, so if you want to refer to a
;       symbol, you should quote it, as above.


; Lists are represented as zero or more elements enclosed in parentheses. The
;   elements can be of any type, including lists. 🔥 You have to quote lists, or
;   Lisp would take them for function calls. One quote protects a whole
;   expression, including expressions within it.
(print  '(my 3 "Sons")); (MY 3 "Sons") 
(print '(the list (a b c) has 3 elements)); (THE LIST (A B C) HAS 3 ELEMENTS)

; ❤️ You can build lists by calling list. 🔥 Since list is a function, its arguments
;   are evaluated. Here we see a call to + within a call to list :
(print (list 'my (+ 2 1) "Sons")); (MY 3 "Sons")

; ⭐️ ⭐️
; Lisp programs are expressed as lists.
; - If a list is quoted, evaluation returns the list itself.
; - If a list is NOT quoted, the list is treated as code, and
;   evaluation returns its value:

; For e.g, Here the first argument is quoted, and so yields a list. The second argument
;   is not quoted, and is treated as a function call, yielding a number.
(print (list '( + 2 1) ( + 2 1))); ((+ 2 1) 3)

; In Common Lisp, there are two ways of representing the empty list. You can
;   represent it as a pair of parentheses with nothing between them, or you can
;   use the symbol NIL . It doesn't matter which way you write as both will be
;   displayed as NIL :
(print ()); NIL
(print NIL); NIL
(print nil); NIL
; You don't have to quote NIL (though it wouldn't hurt) because NIL evaluates
;   to itself.
(print 'nil); NIL

; **** TODO: Continue from page. 12 - 2.4 List Operations *****
; (I am writing ALL CODE FROM THE BOOK HERE for easy testing/reference as I go further).


