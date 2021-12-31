(define (new-if predicate
                then-clause
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5) ; ; (out) 5


(new-if (= 1 1) 0 5) ; ; (out) 0

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x) x)))

; applicative-order evaluation will make the recursive call of sqrt-iter eval before the call to new-if, which means it
; will recur indefinitely.
