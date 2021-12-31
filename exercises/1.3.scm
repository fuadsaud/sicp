(define (sum-of-the-squares-of-the-two-larger-numbers x y z)
  (define (square c) (* c c))
  (define (sum-of-the-squares a b) (+ (square a) (square b)))
  (cond
    ((or (> x y z) (> y x z)) (sum-of-the-squares x y))
    ((or (> x z y) (> z x y)) (sum-of-the-squares x z))
    ((or (> y z x) (> z y x)) (sum-of-the-squares y z))))

(sum-of-the-squares-of-the-two-larger-numbers 10 5 12) ; ; (out) 244
(sum-of-the-squares-of-the-two-larger-numbers 10 12 5) ; ; (out) 244
(sum-of-the-squares-of-the-two-larger-numbers 5 10 12) ; ; (out) 244
(sum-of-the-squares-of-the-two-larger-numbers 5 12 10) ; ; (out) 244
(sum-of-the-squares-of-the-two-larger-numbers 12 10 5) ; ; (out) 244
(sum-of-the-squares-of-the-two-larger-numbers 12 5 10) ; ; (out) 244
