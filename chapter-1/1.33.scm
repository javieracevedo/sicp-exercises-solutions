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