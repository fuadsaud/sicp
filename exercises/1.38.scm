(define (cont-frac n d k)
  (define (cont-frac* i)
    (if (> i k)
      0
      (/ (n i)
         (+ (d i) (cont-frac* (+ 1 i))))))
  (cont-frac* 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (> i k)
      result
      (iter (+ 1 i) (/ (n i)
                       (+ (d i) result)))))
  (iter 1 0))

(define (series i)
  (cond
    ((= 0 (remainder (- i 2) 3))
     (- i (/ (- i 2) 3)))

    ((= 2 i) 2)

    (else 1)))

(+ 2 (cont-frac (lambda (i) 1.0) series 100))
