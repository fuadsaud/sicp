(import chicken.time chicken.string chicken.random)

(define (square n) (* n n))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (pseudo-random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else #f)))

(define (runtime)
  (current-process-milliseconds))

(define (report-prime elapsed-time)
  (conc " *** " elapsed-time))

(define (prime? n)
  (fast-prime? n 100))

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
  (display (search-for-primes (expt 10 100) 3)))

