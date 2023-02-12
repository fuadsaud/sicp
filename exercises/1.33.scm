(define (square n) (* n n))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (next n)
  (if (= 2 n)
    3
    (+ 2 n)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)
         n)
        ((divides? test-divisor n)
         test-divisor)
        (else (find-divisor
               n
               (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (filtered-accumulate combiner null-value term filter a next b)
  (cond
    ((> a b) null-value)
    ((filter a) (combiner (term a)
                          (filtered-accumulate combiner null-value term filter (next a) next b)))
    (else (filtered-accumulate combiner null-value term filter (next a) next b))))

(define (sum-of-squares-of-primes a b)
  (filtered-accumulate + 0 square prime? a increment b))

(sum-of-squares-of-primes 1 4)

(define (product-pos-int-lt-n-rp-n n)
  (filtered-accumulate * 1 identity (lambda (i) (= 1 (gcd i n)) 1 increment n)))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

