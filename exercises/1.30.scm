(define (increment n) (+ 1 n))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))))
  (iter a 0))

(assert
  (=
    (sum identity 1 increment 10)
    (sum-iter identity 1 increment 10)))
