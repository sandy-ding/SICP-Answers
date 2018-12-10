;;; p33-smallest-divisor.scm

(define (smallest-divisor n)
    (find-divisor n 2))

;;; p33-find-divisor.scm

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
            n)
          ((divides? test-divisor n)
            test-divisor)
          (else
            (find-divisor n (+ test-divisor 1)))))
;;; p33-divides.scm

(define (divides? a b)
    (= (remainder b a) 0))