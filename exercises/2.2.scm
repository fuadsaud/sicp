(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start end)
  (cons start end))

(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (average a b)
  (/ (+ a b) 2.0))

(define (midpoint-segment seg)
  (let ((mid-x (average (x-point (start-segment seg))
                        (x-point (end-segment seg))))
        (mid-y (average (y-point (start-segment seg))
                        (y-point (end-segment seg)))))
    (make-point mid-x mid-y)))

(print-point
  (midpoint-segment
    (make-segment (make-point 10 100)
                  (make-point 50 200))))
