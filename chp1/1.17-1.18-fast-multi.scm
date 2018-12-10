(define (double n)
    (+ n n))

(define (halve n)
    (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))

;递归
(define (fast-multi a b)
  (cond ((= b 0) 0)
  		((even? b) (multi (double a) (halve b)))
  		(else (+ a (multi a (- b 1))))))

;迭代
(define (fast-multi a b)
  (multi-iter a b 0))

(define (multi-iter a b product)
    (cond ((= b 0) product)
          ((even? b) (multi-iter (double a) (halve b) product))
          (else (multi-iter a (- b 1) (+ a product)))))