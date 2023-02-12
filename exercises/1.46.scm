(define (iterative-improvement good-enough? improve)
  (define (go guess)
    (if (good-enough? guess)
      guess
      (go (improve guess))))
  go)

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt* x)
  ((iterative-improvement
    (lambda (guess) (= x (* guess guess)))
    (lambda (guess) (average guess (/ x guess))))
   1.0))

(define tolerance 0.00001)
(define (fixed-point* f)
  (iterative-improvement
    (lambda (guess)
      (< (abs (- guess (f guess)))
         tolerance))

    f))

(sqrt* 144)
((fixed-point* cos) 1.0)
