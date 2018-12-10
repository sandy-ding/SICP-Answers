(define (con-frac n d k)
	(define (recur i)
		(if (= i k)
			(/ (n i) (d i))
		    (/ (n i)
		       (+ (d i) 
		       	  (recur (+ i 1))))))
    (recur 1))

(define (tan-cf x k)
	(define (N i)
	  (if (= i 1)
	  	   x
	  	  (- (square x))))
	(define (D i)
		  (- (* 2 i) 1))

  	(exact->inexact (con-frac N D k)))