(define (con-frac n d k)
	(define (recur i)
		(if (= i k)
			(/ (n i) (d i))
		    (/ (n i)
		       (+ (d i) 
		       	  (recur (+ i 1))))))
    (recur 1))

(define (con-frac N D k)
	(define (iter i result)
		(if (= i 0)
			result
			(iter (- i 1) 			
				  (/ (N i) 
			   		 (+ (D i) result)))))
	(iter (- k 1)
		  (/ (N k)(D k))))

(con-frac (lambda (i) 1.0)
		  (lambda (i) 1.0)
		  100)

