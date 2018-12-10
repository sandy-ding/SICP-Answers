; Represent intervals as a center value and a width
(define (make-center-width c w)
   (make-interval (- c w) (+ c w)))

(define (center i)
   (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
   (/ (- (upper-bound i) (lower-bound i)) 2))

(define (percent i)
	(* 100 (/ (width i) (center i))))

(define (make-center-percent c p)
	(make-center-width c (* c (/ p 100.0))))