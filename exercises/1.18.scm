(define (double n)
  (* 2 n))

(define (halve n)
  (/ n 2))

(define (mult a b)
  (define (iter A B N)
    (cond ((= 0 B) N)
          ((even? B) (iter (double A) (halve B) N))
          (else (iter A (- B 1) (+ A N)))))
  (iter a b 0))

(mult 5 10)
