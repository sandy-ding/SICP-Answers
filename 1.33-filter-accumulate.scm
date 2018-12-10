; recursive filter-accumulate
;全局变量都用define来定义，并放在过程代码的外部；
;而局部变量则用let等绑定到过程内部使用
;(define) cannot be used inside the (if ) form 
;because of how (if) creates it's own temporary lexical scope 
;that somehow interrupts (define)
;(let ((x 2) (y 5)) (* x y))
(define (filter-accumulate combiner null-value term a next b valid?)
      (if (> a b)
  	   		null-value
          (let ((rest-terms (filter-accumulate combiner 
                                               null-value 
                                               term 
                                               (next a)
                                               next 
                                               b
                                               valid?)))
          (if (valid? a)
              (combiner (term a)
                        rest-terms)
              rest-terms))))

(define (coprime? i n)
    (and (< i n)
         (= 1 (gcd i n))))

(define (product-of-coprimes n)
    (filter-accumulate *
                       1
                       (lambda (x) x)
                       1
                       (lambda (i) (+ i 1))
                       n
                       (lambda (x) (coprime? x n))))

; iteration
(define (filtered-accumulate combine null-value term a next b valid?)
    (define (iter i result)
        (cond ((> i b)
                result)
              ((valid? i)
                (iter (next i) (combine (term i) result)))
              (else 
                (iter (next i) result))))
    (iter a null-value))