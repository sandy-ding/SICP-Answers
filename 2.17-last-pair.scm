(define (appen l1 l2)
	(if (null? l1)
		 l2
		(cons (car l1) (appen (cdr l1) l2))))

(define (last-pair l)
   (cond ((null? l)
   		  (error "list empty -- LAST-PAIR"))
   		 ((null? (cdr l))
   		  l)
   	     (else
   	      (last-pair (cdr l)))))

(define (reverse l)
	(define (iter remained-items result)
        (if  (null? remained-items)
   		     result
   		     (iter (cdr remained-items) 
   		     	   (cons (car remained-items) result))))
	(iter l '()))