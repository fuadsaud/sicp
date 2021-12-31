(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) ; ; (out) 1024
(A 2 4) ; ; (out) 65536
(A 3 3) ; ; (out) 65536

(define (f n) (A 0 n))   ; f(n) = 2n
(define (g n) (A 1 n))   ; g(n) = { 0   n = 0 , 2^n   otherwise }
(define (h n) (A 2 n))   ; h(n) = 2^^n

(f 5) ; ; (out) 10

(g 5)

(h 5)
(A 1 (A 2 4))
(A 1 (A 1 (A 2 3)))
(A 1 (A 1 (A 1 (A 2 2))))
(A 1 (A 1 (A 1 (A 1 (A 2 1)))))
(A 1 (A 1 (A 1 (A 1 2))))
(A 1 (A 1 (A 1 (A 0 (A 1 1)))))
(A 1 (A 1 (A 1 (A 0 2))))
(A 1 (A 1 (A 1 4)))
(A 1 (A 1 (A 0 (A 1 3))))
(A 1 (A 1 (A 0 (A 0 (A 1 2)))))
(A 1 (A 1 (A 0 (A 0 (A 0 (A 1 1))))))
(A 1 (A 1 (A 0 (A 0 (A 0 2)))))
(A 1 (A 1 (A 0 (A 0 4))))
(A 1 (A 1 (A 0 8)))
(A 1 (A 1 16))
(A 1 (A 1 16))
(A 1 (A 0 (A 1 15)))
(A 1 (A 0 (A 0 (A 1 14))))
(A 1 (A 0 (A 0 (A 0 (A 1 13)))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 1 12))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 11)))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 10))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 9)))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 8))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 7)))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 6))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 5)))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 4))))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 3)))))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 2))))))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 1 1)))))))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2))))))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4)))))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8))))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16)))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 32))))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 64)))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 128))))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 256)))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 512))))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1024)))))))
(A 1 (A 0 (A 0 (A 0 (A 0 (A 0 2048))))))
(A 1 (A 0 (A 0 (A 0 (A 0 4096)))))
(A 1 (A 0 (A 0 (A 0 8192))))
(A 1 (A 0 (A 0 16384)))
(A 1 (A 0 32768))
(A 1 65536)
...
