(define (increment n) (+ 1 n))

(define (square n) (* n n))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product identity 1 increment n))

(factorial 10)

(define (pi-approx n)
  (define (numerator x)
    (if (odd? x)
      (+ 1 x)
      (+ 2 x)))

  (define (denominator x)
    (if (odd? x)
      (+ 2 x)
      (+ 1 x)))

  (define (term x)
    (/ (numerator x)
       (denominator x)))

  (* 4.0 (product-iter term 1.0 increment n)))

(pi-approx 10000000)
