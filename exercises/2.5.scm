(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (iter b x n)
  (if (= 0 (remainder x b))
    (iter b (/ x b) (+ 1 n))
    n))

(define (car z)
  (iter 2 z 0))

(define (cdr z)
  (iter 3 z 0))

(cons 100 2)

(car (cons 100 2))
(cdr (cons 100 2))
