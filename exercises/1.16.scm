(define (square n)
  (* n n))

(define (fast-expt b n)
  (cond ((= n 0)
         1)
        ((even? n)
         (square (fast-expt b (/ n 2))))
        (else
         (* b (fast-expt b (- n 1))))))

(fast-expt 2 8)

(define (fast-expt-iter b n)
  (define (iter B N A)
    (cond ((= 0 N) A)
          ((even? N) (iter (square B) (/ N 2) A))
          (else (iter B (- N 1) (* B A)))))
  (iter b n 1))

(fast-expt-iter 3 3)
