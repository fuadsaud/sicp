(define (make-interval a b) (cons (min a b)
                                  (max a b)))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (make-center-percent c p)
  (make-interval (* c (- 1 p))
                 (* c (+ 1 p))))

(define (average a b)
  (/ (+ a b) 2.0))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i))
     2.0))

(define (center i)
  (average (lower-bound i) (upper-bound i)))

(define (percent i)
  (/ (width i) (center i)))

(define a (make-center-percent 5 0.02))
(define b (make-center-percent 10 0.03))
(define c (mul-interval a b))
(percent c)
