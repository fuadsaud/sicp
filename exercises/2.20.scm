(define (parity x)
  (remainder x 2))

; (define (foldr f acc coll)
;   (f (foldr f acc (cdr coll))
;      (car coll)))


(define (filter f coll)
  (display "foo")
  (display coll)
  (foldr (lambda (i acc)
           (display i)
           (if (f i)
             (cons i acc)
             acc))
         '()
         coll))

(filter odd? '(1 2 3))

(define (same-parity x . rest)
  (cons x (filter (lambda (y) (= (parity x) (parity y)))
                 rest)))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
