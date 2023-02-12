(define (equal? a b)
  (or (eq? a b)
      (and (list? a)
           (list? b)
           (equal? (car a) (car b))
           (equal? (cdr a) (cdr b)))))

(equal? '(this is a list)
        '(this is a list)) ; ; (out) #t

(equal? '(this is a list)
        '(this (is a) list)) ; ; (out) #f

(equal? (car (cdr '(this is a list)))
        (car (cdr '(this (is a) list))))
