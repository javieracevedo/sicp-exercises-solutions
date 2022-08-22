#lang scheme

(define (new-if predicate then-clause else-clause)
(cond (predicate then-clause)
      (else else-clause)))


(new-if (= 2 3) 0 5)
;5

(new-if (= 1 1) 0 5)
;0

; Square root program with custom if

(define (sqrt-iter guess x)
(new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x)
                   x)))
(sqrt-iter 1 2)


; The interpreter hangs (assuming the interpreter is using the aplicative order of evaluation), when new-if gets called, 
; the arguments or operands will get evaluated first, and they they would be applied to the new-if compound procedure, the
; good-enough? and guess arguments are fine, the problem arises with the recursive call to sqrt-iter gets, since all the 
; arguments will be evaluated before applying the compound procedure, sqrt-iter will never be not called, making the 
; program to run forever.

; The regular if is a special form, probably handles this scenarios by evaluation the predicate first, and not the 
; operands first. 