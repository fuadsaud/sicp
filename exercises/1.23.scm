(import chicken.time chicken.string)

(define (next n)
  (if (= 2 n)
    3
    (+ 2 n)))

(define (square n) (* n n))

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

(define (runtime)
  (current-process-milliseconds))

(define (report-prime elapsed-time)
  (conc " *** " elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
      (list n (report-prime (- (runtime) start-time)))
      (list n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (search-for-primes lower n)
  (define (search-for-primes-iter x n acc)
    (if (= 0 n)
      acc
      (if (prime? x)
          (search-for-primes-iter (+ 1 x) (- n 1) (cons (timed-prime-test x) acc))
          (search-for-primes-iter (+ 1 x) n acc))))
  (reverse (search-for-primes-iter lower n '())))

(define (main args)
  (display (search-for-primes (expt 10 12) 3))
  (display (search-for-primes (expt 10 15) 3)))

