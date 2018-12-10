(define (make-segment s e)
	(cons s e))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (make-point x y)
	(cons x y))

(define (x-point p)
  	(car p))

(define (y-point p)
  	(cdr p))

(define (midpoint-segment seg)
	(let ((start (start-segment seg))
		 (end (end-segment seg)))
  	(make-point (average (x-point start)
  				         (x-point end))
  				(average (y-point start)
  				         (y-point end)))))

(define (average x y)
	(/ (+ x y) 2))

(define (print-point p)
    (newline)
    (display "(")
    (display (x-point p))
    (display ",")
    (display (y-point p))
    (display ")"))

(define start (make-point 1 3))
(define end (make-point 4 3))
(define seg (make-segment start end))
(define mid (midpoint-segment seg))
(print-point mid)