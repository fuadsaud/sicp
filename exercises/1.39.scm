(define (square n) (* n n))

(define (cont-frac n d k)
  (define (cont-frac* i)
    (if (> i k)
      0
      (/ (n i)
         (+ (d i) (cont-frac* (+ 1 i))))))
  (cont-frac* 1))

(define (tan-cf x k)
  (cont-frac
    (lambda (i) (if (= 1 i) x (- (square x))))
    (lambda (i) (- (* i 2) 1))
    k))

(assert (= (tan-cf (/ 3.14 6) 10)
           (tan (/ 3.14 6))))
