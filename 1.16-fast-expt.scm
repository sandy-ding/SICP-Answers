;method 1
(define (fast-expt b n)
  (expt-iter b n b))

(define (expt-iter b counter a)

  (cond ((= counter 0) 1)
  	((= counter 1) a)
  	((even? counter) (expt-iter b (/ counter 2) (square a)))
  	(else (* b (expt-iter b (- counter 1) a)))))

(define (even? n)
  (= (remainder n 2) 0))

;method 2
(define (fast-expt b n)
    (expt-iter b n 1))

(define (expt-iter b n a)
    (cond ((= n 0)
            a)
          ((even? n)
            (expt-iter (square b)
                       (/ n 2)
                       a))
          ((odd? n)
            (expt-iter b
                       (- n 1)
                       (* b a)))))