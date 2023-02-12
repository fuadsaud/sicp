(define (make-interval a b) (cons (min a b)
                                  (max a b)))

(define (lower-bound i) (car i))
(define (upper-bound i) (cdr i))

(define (mul-interval* x y)
  (let ((sign (lambda (a) (/ a (abs a))))
        (lb-x (lower-bound x))
        (ub-x (upper-bound x))
        (lb-y (lower-bound y))
        (ub-y (upper-bound y)))
    (let ((match? (lambda (seq) (equal? (list (sign lb-x) (sign ub-x) (sign lb-y) (sign ub-y))
                                        seq))))
      (cond
        ((match? (list -1 -1 -1 -1)) (make-interval (* ub-x ub-y) (* lb-x lb-y)))

        ((match? (list -1 -1 -1  1)) (make-interval (* lb-x ub-y) (* lb-x lb-y)))
        ((match? (list -1 -1  1  1)) (make-interval (* lb-x ub-y) (* ub-x lb-y)))

        ((match? (list -1  1 -1 -1)) (make-interval (* ub-x lb-y) (* lb-x lb-y)))

        ((match? (list -1  1 -1  1)) (make-interval (min (* lb-x ub-y) (* ub-x lb-y))
                                                    (max (* lb-x lb-y) (* ub-x ub-y))))

        ((match? (list -1  1  1  1)) (make-interval (* lb-x ub-y) (* ub-x ub-y)))

        ((match? (list  1  1 -1 -1)) (make-interval (* ub-x lb-y) (* lb-x ub-y)))
        ((match? (list  1  1 -1  1)) (make-interval (* ub-x lb-y) (* ub-x ub-y)))

        ((match? (list  1  1  1  1)) (make-interval (* lb-x lb-y) (* ub-x ub-y)))))))

(define a (make-interval 2 4))
(define b (make-interval -2 4))
(define c (make-interval -4 -2))

(mul-interval* a b)

(eqv? (list -1 -1 1 1) (list -1 -1 1 1))

(for-each (lambda (x)
            (for-each (lambda (y)
                        (display x) (display y) (newline)
                        (assert (equal? (mul-interval x y)
                                      (mul-interval* x y))))
                      (list a b c)))
          (list a b c))

(mul-interval a a)
; (4 . 16)
(mul-interval a b)
; (-8 . 16)
(mul-interval a c)
; (-16 . -4)
(mul-interval b a)
; (-8 . 16)
(mul-interval b b)
; (-8 . 16)
(mul-interval b c)
; (-16 . 8)
(mul-interval c a)
; (-16 . -4)
(mul-interval c b)
; (-16 . 8)
(mul-interval c c)
; (4 . 16)
