(define (increment n) (+ n 1))

(define (cube x)
 (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpsons-rule f a b n)
  (let ((h (/ (- b a) n)))
    (define (y k)
      (let ((yk (f (+ a (* k h)))))
        (cond
          ((= k n) yk)
          ((= 0 k) yk)
          ((even? k) (* 2 yk))
          (else (* 4 yk)))))
    (* (/ h 3)
       (sum y 0 increment n))))

(integral cube 0 1 0.01)
(simpsons-rule cube 0 1 100)

(integral cube 0 1 0.001)
(simpsons-rule cube 0 1 1000)
