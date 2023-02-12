(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (inc x) (+ 1 x))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define one* (add-1 zero))
(define two* (add-1 one*))

(define (add m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))


((zero inc) 0)
((one inc) 0)
((two inc) 0)
((one* inc) 0)
((two* inc) 0)


(((add-1 one) inc) 0)

(((add one two) inc) 0)
