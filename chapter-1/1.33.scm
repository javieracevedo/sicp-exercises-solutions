(define (increment n) (+ n 1))
        
(define (divides-between a b)
    (if (= a b)
        #f
        (if (= (remainder b a) 0)
            #t
            (divides-between (increment a) b))))

(define (prime? n)
    (if (= n 1)
        #f
        (not (divides-between 2 n))))
    

(define (filtered-accumulate combiner null-value term a next b predicate)
    (if (> a b)
      null-value
      (if (predicate a)
          (combiner (term a)
                   (filtered-accumulate combiner null-value term (next a) next b predicate))
          (filtered-accumulate combiner null-value term (next a) next b predicate))))

(define (identity x) x)
(filtered-accumulate + 0 identity 1 increment 9 prime?)


(define (find-gcd a b divisor)
            (if (and (= (remainder a divisor) 0) (= (remainder b divisor) 0))
                divisor
                (find-gcd a b (- divisor 1))))

(define (co-prime? b)
    (lambda (a) 
        (define divisor (if (= a 1) 1 (- a 1)))
        
        (if (and (= (find-gcd a b divisor) 1) (not (= a b))) 
            #t
            #f)))

(filtered-accumulate * 1 identity 1 increment 14 (co-prime? 14))


; Ecludian way of finding GCD

; (define (gcd a b)
;     (cond ((> a b) (gcd b a))
;           ((= b 0) a)
;           (else (gcd a (remainder b a)))))
