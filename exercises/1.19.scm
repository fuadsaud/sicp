(define (fib-iter a b p q count)
  (cond
    ((= 0 count)
     b)
    ((even? count)
     (fib-iter a
               b
               (+ (* p p) (* q q))
               (+ (* 2 p q) (* q q))
               (/ count 2)))

    (else
      (fib-iter (+ (* b q)
                   (* a q)
                   (* a p))

                (+ (* b p)
                   (* a q))

                p
                q
                (- count 1)))))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(fib 10)


; Tpq (a,b) = (bq + aq + ap | bp + aq)
; Tpq(Tpq (a,b)) = (((bp + aq) q) + ((bq + aq + ap) q) + ((bq + aq + ap) p)  | (bp + aq) p + (bq + aq + ap) q)
; Tpq(Tpq (a,b)) = (bpq + aq2 + bq2 + aq2 + apq + bqp + aqp + ap2 | bp2 + aqp + bq2 + aq2 + apq)
; Tpq(Tpq (a,b)) = (b(2pq + q2) + a(2q2 + 2qp + p2) | b(p2 + q2) + a(2qp + q2)) = Tp'q'
; Tpq(Tpq (a,b)) = (b(2pq + q2) + a(2pq + q2) + a(q2 + p2) | b(p2 + q2) + a(2qp + q2)) = Tp'q'
