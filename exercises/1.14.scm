(define (cube x) (* x x x))
(define (p x)
  (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
    angle
    (begin
      (print "foo: " (/ angle 3.0))
      (p (sine (/ angle 3.0))))))

(sine 12.15)
