(define (dec x) (- x 1))
(define (inc x) (+ x 1))

(define (pascal row col)
  (cond ((or (= col 0) (= col row)) 1)
        ((or (= col 1) (= col (dec row))) row)
        (else (+ (pascal (dec row) (dec col))
                 (pascal (dec row) col)))))

(pascal 0 0) ; ; (out) 1
(pascal 1 0) ; ; (out) 1
(pascal 1 1) ; ; (out) 1
(pascal 2 0) ; ; (out) 1
(pascal 2 1) ; ; (out) 2
(pascal 2 2) ; ; (out) 1
(pascal 3 0) ; ; (out) 1
(pascal 3 1) ; ; (out) 3
(pascal 3 2) ; ; (out) 3
(pascal 3 3) ; ; (out) 1
(pascal 4 0) ; ; (out) 1
(pascal 4 1) ; ; (out) 4
(pascal 4 2) ; ; (out) 6
(pascal 4 3) ; ; (out) 4
(pascal 4 4) ; ; (out) 1
(pascal 5 0) ; ; (out) 1
(pascal 5 1) ; ; (out) 5
(pascal 5 2) ; ; (out) 10
(pascal 5 3) ; ; (out) 10
(pascal 5 4) ; ; (out) 5
(pascal 5 5) ; ; (out) 1
(pascal 6 0) ; ; (out) 1
(pascal 6 1) ; ; (out) 6
(pascal 6 2) ; ; (out) 15
(pascal 6 3) ; ; (out) 20
(pascal 6 4) ; ; (out) 15
(pascal 6 5) ; ; (out) 6
(pascal 6 6) ; ; (out) 1
