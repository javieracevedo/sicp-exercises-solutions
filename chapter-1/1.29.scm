#lang scheme

; Not my solution. Got it from here -> http://community.schemewiki.org/?sicp-ex-1.29

(define (sum term a next b)

(if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (cube x) (* x x x))

(define (simpson-integral fn a b n)
  (define (increment x) (+ x 1))
  (define h (/ (- b a) n))
  (define (yk k) (fn (+ a (* k h))))
  (define (simpson-term k)
    (* (cond ((or (= k 0) (= k n)) 1)
            ((odd? k) 4)
            (else 2))
      (yk k)))
  (* (/ h 3) (sum simpson-term 0 increment n)))