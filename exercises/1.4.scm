(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; The (if ..) experession returns the operator to be applied to args a and b.

(a-plus-abs-b 10 -5) ; ; (out) 15
(a-plus-abs-b 10 5) ; ; (out) 15

