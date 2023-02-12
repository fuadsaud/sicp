(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; applicative order evaluation

(gcd 206 40) ; (remainder 206 40)
(gcd 40 6) ; (remainder 40 6)
(gcd 6 4) ; (remainder 6 4)
(gcd 4 2) ; (remainder 4 2)
(gcd 2 0)
2

; total = 4

;; normal order evaluation

(gcd 206 40)

(if (= 0 40))

(gcd 40 (remainder 206 40))

(if (= 0 (remainder 206 40))) ; false, +1

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))

(if (= 0 (remainder 40 (remainder 206 40)))) ; false, +2

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40))))

(if (= 0 (remainder (remainder 206 40)
                    (remainder 40 (remainder 206 40))))) ; false, +4

(gcd (remainder (remainder 206 40)
                (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40))
                (remainder (remainder 206 40)
                           (remainder 40 (remainder 206 40)))))

(if (= 0 (remainder (remainder 40 (remainder 206 40))
                    (remainder (remainder 206 40)
                               (remainder 40 (remainder 206 40)))))) ; true, +7

(remainder (remainder 206 40)
           (remainder 40 (remainder 206 40)))

(remainder 6
           (remainder 40 (remainder 206 40)))

(remainder 6
           (remainder 40 6))

(remainder 6 4)

(remainder 6 4)

2 ; +4

; total = 18
