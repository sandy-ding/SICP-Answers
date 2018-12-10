(define (same-parity sample . others)
	(define (iter f l)
		(cond  ((null? l)
			    '())
			   ((f (car l))
			    (cons (car l) (iter f (cdr l))))
			   (else
			    (iter f (cdr l)))))
	
 	(iter (if (even? sample)
 			   even?
 			   odd?) 
 		  (cons sample others)))

; use filters
(define (sameparity sample . others)
	(filters (if (even? sample)
 			   even?
 			   odd?) 
			 (cons sample others)))