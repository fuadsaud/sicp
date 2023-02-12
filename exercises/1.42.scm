(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (square n) (* n n))
(define (inc x) (+ 1 x))

((compose square inc) 6)
