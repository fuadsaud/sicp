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

(define (div-interval x y)
  (mul-interval x
                (make-interval
                  (/ 1.0 (upper-bound y))
                  (/ 1.0 (lower-bound y)))))

(define (sub-interval x y)
  (add-interval x
                (make-interval (- (upper-bound y))
                               (- (lower-bound y)))))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i))
     2.0))

(define a (make-interval 5 10))
(define b (make-interval 10 20))
(define c (make-interval 100 110))

(= (width (add-interval a b))
   (+ (width a)
      (width b)))

(= (width (sub-interval a b))
   (+ (width a)
      (width b)))

(not (= (width (mul-interval a b))
        (width (mul-interval a c))))
