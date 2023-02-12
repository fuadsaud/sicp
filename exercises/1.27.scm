(import chicken.time chicken.string chicken.random)

(define (square n) (* n n))

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

(define (fast-expt b n)
  (cond ((= n 0)
         1)
        ((even? n)
         (square (fast-expt b (/ n 2))))
        (else
         (* b (fast-expt b (- n 1))))))

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

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (full-fermat-test n)
  (define (iter a)
    (cond
      ((= 1 a) #t)
      ((fermat-test n a) (iter (- a 1)))
      (else #f)))
  (iter (- n 1)))

(define (carmichael-number? n)
  (and (not (prime? n))
       (fermat-full-test n)))

(full-fermat-test 561)
