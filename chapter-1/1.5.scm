#lang scheme

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; Then it evaluates to:
; (test 0 (p))

;; NORMAL ORDER OF EVALUATION

(test 0 (p)) ; step 0
(if (= x 0) ; step 1
     0
     y)
(if (= 0 0) ; step 2
     0
     (p))
0 ; step 3, calls the consequent expression ,confirming this is the normal order of evaluation


;; APPLICATIVE ORDER OF EVALUATION

(test 0 (p)) ; hangs, as soon as it evaluates the second argument


; Explanation

; If the interpreter is using the normal order of evaluation it will print out 0, the infinite 
; recursive call to (p) will never be evaluated, because the **test**  compound procedure is 
; first expanded and then evaluated, and since the condition to evaluate the alternative expression 
; is never true, **(p)** will never be called.

; If the interpreter is using the applicative-order evaluation it will hang the program, because the infinite recursive call to (p) will get evaluated first, before expanding the **test** compound procedure.
