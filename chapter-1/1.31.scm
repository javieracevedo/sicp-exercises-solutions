; Product 

(define (product term a next b)
(if (> a b)
    1
    (* (term a)
       (product term (next a) next b))))

; Factorial

(define (factorial n)
(define (identity x) x)
(define (increment x) (+ x 1))
(product identity 1 increment n))

;; (factorial 5)


; pi term (this procedure was not part of my solution, got it from here -> http://community.schemewiki.org/?sicp-ex-1.31)

(define (pi-term n)
(if (even? n)
    (/ (+ n 2) (+ n 1))
    (/ (+ n 1) (+ n 2))))

(define (next n) (+ n 1))

(* (product pi-term 1 next 200) 4)