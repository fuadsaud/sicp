(list 'a 'b 'c) ; ; (out) (a b c)

(list (list 'george)) ; ; (out) ((george))


(cdr '((x1 x2) (y1 y2))) ; ; (out) ((y1 y2))

(cadr '((x1 x2) (y1 y2)))

(pair? (car '(a short list)))

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

(memq 'red '((red shoes) (blue socks))) ; ; (out) #f

(memq 'red '(red shoes blue socks)) ; ; (out) (red shoes blue socks)
