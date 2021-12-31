(define (f-rec n)
  (cond ((< n 3) n)
        (else    (+ (f-rec (- n 1))
                    (* 2 (f-rec (- n 2)))
                    (* 3 (f-rec (- n 3)))))))

(f-rec 0) ; ; (out) 0
(f-rec 1) ; ; (out) 1
(f-rec 2) ; ; (out) 2
(f-rec 3) ; ; (out) 4
(f-rec 4) ; ; (out) 11
(f-rec 5) ; ; (out) 25
(f-rec 6) ; ; (out) 59
(f-rec 7) ; ; (out) 142
(f-rec 8) ; ; (out) 335
(f-rec 9) ; ; (out) 796
(f-rec 10) ; ; (out) 1892

(define (f-iter n)
  (define (f-iter* a b c i)
    (if (<= i 0)
      a
      (f-iter* (+ a (* 2 b) (* 3 c)) a b (- i 1))))
  (if (< n 3)
    n
    (f-iter* 2 1 0 (- n 2))))

(f-iter 0) ; ; (out) 0
(f-iter 1) ; ; (out) 1
(f-iter 2) ; ; (out) 2
(f-iter 3) ; ; (out) 4
(f-iter 4) ; ; (out) 11
(f-iter 5) ; ; (out) 25
(f-iter 6) ; ; (out) 59
(f-iter 7) ; ; (out) 142
(f-iter 8) ; ; (out) 335
(f-iter 9) ; ; (out) 796
(f-iter 10) ; ; (out) 1892

(f-rec 3)
(+ (f-rec 2)
   (* 2 (f-rec 1))
   (* 3 (f-rec 0)))
(+ 2
   (* 2 1)
   (* 3 0))
4

(f-rec 4)
(+ (f-rec 3)
   (* 2 (f-rec 2))
   (* 3 (f-rec 1)))
(+ 4
   (* 2 2)
   (* 3 1))
11
