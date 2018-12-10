(define (con-frac n d k)
	(define (recur i)
		(if (= i k)
			(/ (n i) (d i))
		    (/ (n i)
		       (+ (d i) 
		       	  (recur (+ i 1))))))
    (recur 1))

(define (e k)
	(define (D i)
		(if (= (remainder (+ i 1) 3) 0)
			(* (/ (+ i 1) 3) 2)
		     1))

  	(+ 2
  	   (con-frac (lambda (i) 1.0)
			      D
		    	  k)))