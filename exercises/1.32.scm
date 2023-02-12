(define (identity x) x)
(define (increment x) (+ 1 x))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a)
              (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (acc-product-iter term a next b)
  (accumulate-iter * 1 term a next b))

(define (acc-sum-iter term a next b)
  (accumulate-iter + 0 term a next b))

(define (acc-product term a next b)
  (accumulate * 1 term a next b))

(define (acc-sum term a next b)
  (accumulate + 0 term a next b))

(assert (= 55
          (sum identity 1 increment 10)
          (acc-sum identity 1 increment 10)
          (acc-sum-iter identity 1 increment 10)))

(assert (= 3628800
          (product identity 1 increment 10)
          (acc-product identity 1 increment 10)
          (acc-product-iter identity 1 increment 10)))
