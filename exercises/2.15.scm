(define (make-interval a b) (cons (min a b)
                                  (max a b)))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (add-interval x y)
  (make-interval (+ (lower-bound x)
                    (lower-bound y))
                 (+ (upper-bound x)
                    (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x)
               (lower-bound y)))
        (p2 (* (lower-bound x)
               (upper-bound y)))
        (p3 (* (upper-bound x)
               (lower-bound y)))
        (p4 (* (upper-bound x)
               (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (spans-zero? y)
  (and (<= (lower-bound y) 0)
       (>= (upper-bound y) 0)))

(define (div-interval x y)
  (if (spans-zero? y)
    (error "Error: The denominator should not span 0.")
    (mul-interval x
                  (make-interval
                    (/ 1.0 (upper-bound y))
                    (/ 1.0 (lower-bound y))))))

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

(define (par1 r1 r2)
  (div-interval
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
     one
     (add-interval
      (div-interval one r1)
      (div-interval one r2)))))

(define a (make-center-percent 100 0.02))
(define b (make-center-percent 50 0.03))
(define aa (div-interval a a))
(define c (div-interval a b))

(center aa)
