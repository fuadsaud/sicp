(define (square x) (* x x))

(define (make-point x y)
  (cons x y))

(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment start end)
  (cons start end))

(define (start-segment seg) (car seg))
(define (end-segment seg) (cdr seg))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (average a b)
  (/ (+ a b) 2.0))

(define (make-rect tl br)
  (make-segment tl br))

(define (segment-length seg)
  (sqrt (+ (square (- (x-point (start-segment seg))
                      (x-point (end-segment seg))))
           (square (- (y-point (start-segment seg))
                      (y-point (end-segment seg)))))))

(define (horizontal-edge rect)
  (make-segment (start-segment rect)
                (make-point (x-point (end-segment rect))
                            (y-point (start-segment rect)))))

(define (vertical-edge rect)
  (make-segment (start-segment rect)
                (make-point (x-point (start-segment rect))
                            (y-point (end-segment rect)))))

(define (horizontal-edge-length rect)
  (segment-length (horizontal-edge rect)))

(define (vertical-edge-length rect)
  (segment-length (vertical-edge rect)))

(define (rect-perimeter rect)
  (+ (* 2 (horizontal-edge-length rect))
     (* 2 (vertical-edge-length rect))))

(define (rect-area rect)
  (* (horizontal-edge-length rect)
     (vertical-edge-length rect)))

(define square1 (make-rect (make-point 0 1)
                           (make-point 1 0)))

(define rect1 (make-rect (make-point 10 100)
                         (make-point 30 70)))

(rect-perimeter square1)
(rect-area square1)

(rect-perimeter rect1)
(rect-area rect1)
