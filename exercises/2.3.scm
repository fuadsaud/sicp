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
  (cons tl br))

(define (rect-top-left rect) (car rect))
(define (rect-bottom-right rect) (cdr rect))

(define (horizontal-edge-length rect)
  (let ((tl (rect-top-left rect))
        (br (rect-bottom-right rect)))
    (- (x-point br) (x-point tl))))

(define (vertical-edge-length rect)
  (let ((tl (rect-top-left rect))
        (br (rect-bottom-right rect)))
    (- (y-point tl) (y-point br))))

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
