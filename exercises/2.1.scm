(define (make-rat n d)
  (let ((g (gcd n d))
        (ds (/ d (abs d))))
    (cons (/ (* n ds) g)
          (/ (abs d) g))))

(define (numer x) (car x))
(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(print-rat (make-rat 3 -27))
