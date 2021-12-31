(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough-tolerance? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter good-enough? guess x)
  (print guess ", " x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter good-enough? (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter good-enough-tolerance? 1.0 x))

(sqrt 144) ; ; (out) 12.0000000124087

(sqrt 25) ; ; (out) 5.00002317825395

(sqrt 2) ; ; (out) 1.41421568627451

(sqrt 0.5) ; ; (out) 0.707107843137255

(sqrt 0.0001) ; ; (out) 0.0323084483304812

(sqrt 1000000000000) ; ; (out) 1000000.0

; (sqrt 10000000000000) ; ; HANGS!!

(define (good-enough-next? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess 0.001)))

(define (sqrt-alt x)
  (sqrt-iter good-enough-next? 1.0 x))

(sqrt-alt 0.0001) ; ; (out) 0.0100007140387117

(sqrt-alt 10000000000000)
