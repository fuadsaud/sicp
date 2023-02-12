(define dx 0.00001)
(define pi 3.1415)

(define (smooth f dx)
  (lambda (x)
    (/ (+ (f (- x dx))
          (f x)
          (f (+ x dx)))
       3)))

(define (n-fold-smooth f dx n)
  (repeated (smooth f dx) n))

(sin (/ pi 2))
((smooth sin 0.7) (/ pi 2))
