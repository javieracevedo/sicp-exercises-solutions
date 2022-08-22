#lang scheme

(define (squares x) (* x x))
(define (sum_of_squares a b) (+ (squares a) (squares b)))

; My Solution

(define (sum_of_largest a b c) 
  (cond 
    ((or (>= a b c) (>= b a c)) (sum_of_squares a b))
    ((or (>= c b a) (>= b c a)) (sum_of_squares c b))
    (else (sum_of_squares c b))))

(sum_of_squares 2 2)

; Comunity Solution 

(define (sum_of_largest-community x y z) 
   (cond ((and (<= x y) (<= x z)) (sum_of_squares y z)) 
         ((and (<= y x) (<= y z)) (sum_of_squares x z)) 
         (else (sum_of_squares x y))))

; Comunity Best Solution

(define (sum_of_largest-community-best x y z) 
   (sum_of_squares (max x y) (max (min x y) z)))
