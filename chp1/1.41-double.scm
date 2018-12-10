;load 1.36-fixed-point.scm

(define (expt base n)
    (if (= n 0)
        1
        ((repeated (lambda (x) (* base x)) n) 1)))

(define (average-damp f)
	(lambda (x) (average x (f x))))

(define (repeated f n)
    (if (= n 1)
        f
        (lambda (x)
            (f ((repeated f (- n 1)) x)))))

(define (average-damp-n-times f n)
    ((repeated average-damp n) f))

(define (damped-nth-root n damp-times)
 	(lambda(x)
 		(fixed-point
 			(average-damp-n-times
 				(lambda(y)
 					(/ x (expt y (- n 1))))
 				damp-times)
 			1.0)))

(define (lg n)
	(cond ((> (/ n 2) 1)
	 	    (+ 1 (lg (/ n 2))))				
	      ((< (/ n 2) 1)
	  		0)
	      (else
	        1)))

(define (nth-root n)
    (damped-nth-root n (lg n)))