(define (reverse l)
  (define (reverse* r l)
    (if (null? l)
      r
      (reverse* (cons (car l) r) (cdr l))))
  (reverse* '() l))

(reverse (list 1 4 9 16 25))
