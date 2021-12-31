(define (square x) (* x x))
(define (cube x) (* x x x))

(define (improve guess x)
  (/ (+ (/ x
           (square guess))
        (* 2 guess))
     3))

(define (good-enough-tolerance? guess x)
  (< (abs (- (cube guess)x)) 0.001))

(define (cube-root-iter good-enough? guess x)
  (if (good-enough? guess x)
      guess
      (cube-root-iter good-enough? (improve guess x) x)))

(define (cube-root x)
  (cube-root-iter good-enough-tolerance? 1.0 x))

(good-enough-tolerance? (improve 1.0 9) 9)

(cube-root 9)

(cube-root 64)

(cube-root 1000)
