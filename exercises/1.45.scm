(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x)
    (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (display guess) (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next))))
  (try first-guess))

(define (log2 x)
  (/ (log x)
     (log 2)))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= 1 n)
    f
    (compose f (repeated f (- n 1)))))

(define (nth-root n x)
  (fixed-point
    ((repeated average-damp (floor (log2 n)))
     (lambda (y) (/ x (expt y (- n 1)))))
    1.0))

(define (blah n x)
  (average-damp
    (lambda (y) (/ x (expt y (- n 1))))))

; ((blah 4 16) ((blah 4 16) ((blah 4 16) ((blah 4 16) ((blah 4 16) ((blah 4 16) 1.0))))))

(nth-root 4 16)
(nth-root 128 340282366920938463463374607431768211456)
