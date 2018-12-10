; recursive product
(define (product term a next b)
  (if (> a b)
  	   1
  	  (* (term a)
  	  	 (product term (next a) next b))))

; iteration product
(define (product term a next b)
  	(define (iter a result)
    	(if (> a b)
    		result
    		(iter (next a) 
    			  (* result (term a)))))
	(iter a 1))

; 阶乘
(define (factorial n) 	
	(product (lambda (x) x)
			  1
			 (lambda (i) (+ i 1))
			  n))

; calculate pi
(define (pi n)

	(define (term k)
		(if	(odd? k)
			(/ (+ 1 k) (+ 2 k))
			(/ (+ 2 k) (+ 1 k))))

  (* 4 (product term
  		   		(exact->inexact 1)
  		   		(lambda (i) (+ i 1))
  		   		n)))