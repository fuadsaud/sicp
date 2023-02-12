(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= 1 n)
    f
    (compose f (repeated f (- n 1)))))

((repeated inc 10) 1)
((repeated square 2) 5)
