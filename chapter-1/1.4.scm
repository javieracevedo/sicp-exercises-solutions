#lang scheme

(define (a-plus-abs-b a b)
((if (> b 0) + -) a b))

; Behaviour
; (a-plus-abs-b 4 -1)
; ((if (> b 0) + -) 4 -1)
; (- 4 -1)
; 5