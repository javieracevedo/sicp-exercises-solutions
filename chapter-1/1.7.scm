#lang scheme

(define (square a) (* a a))

(define (good-enough? guess x)
  (if (= guess (improve guess x)) 
        #t
        (< (abs (- (square guess) x)) 0.001)))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)  
  (sqrt-iter 1.0 x))

;  Very large number
(sqrt 2000000000000000000000000000000000)