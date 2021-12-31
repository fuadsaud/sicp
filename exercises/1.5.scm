(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; With applicative-order evaluation, the following call will hang on infinite recursion.
; With normal-order evaluation the call will return 0, as the if form would short circuit and y would never be evaluated.

(test 0 (p))
