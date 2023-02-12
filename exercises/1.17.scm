(define (double n)
  (* 2 n))

(define (halve n)
  (/ n 2))

(define (mult a b)
  (cond ((= 0 b) 0)
        ((even? b) (mult (double a) (halve b)))
        (else (+ a (mult a (- b 1))))))

(mult 5 10)
