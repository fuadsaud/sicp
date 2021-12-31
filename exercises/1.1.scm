10 ; ; (out) 10

(+ 5 3 4) ; ; (out) 12

(- 9 1) ; ; (out) 8

(/ 6 2) ; ; (out) 3

(+ (* 2 4) (- 4 6)) ; ; (out) 6

(define a 3) ; ; (out)

(define b (+ a 1)) ; ; (out)

(+ a b (* a b)) ; ; (out) 19

(= a b) ; ; (out) #f

(if (and (> b a) (< b (* a b)))
    b
    a) ; ; (out) 4

(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25)) ; ; (out) 16

(+ 2 (if (> b a) b a)) ; ; (out) 6

(* (cond ((> a b) a)
         ((< a b) b)
         (else -1))
   (+ a 1)) ; ; (out) 16
