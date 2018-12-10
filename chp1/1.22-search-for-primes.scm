;;; 22-next-odd.scm
(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

;;; p33-prime.scm
(define (prime? n)
    (= n (smallest-divisor n)))

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
            (find-divisor n (next test-divisor)))))

;;; p33-divides.scm
(define (divides? a b)
    (= (remainder b a) 0))

;;; 22-continue-primes.scm
(define (continue-primes n count)
    (cond ((= count 0)
            (display "are primes."))
          ((prime? n)
            (display n)
            (newline)
            (continue-primes (next-odd n) (- count 1)))
          (else
            (continue-primes (next-odd n) count))))

(define (next n)
	(if (= n 2)
		3
		(+ n 2)))

;;; 22-search-for-primes.scm
(define (search-for-primes n)
    (let ((start-time (real-time-clock)))
        (continue-primes n 3)
        (- (real-time-clock) start-time)))
