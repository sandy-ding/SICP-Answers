; a
(define (make-mobile left right)
	(list left right))

(define (make-branch length structure)
	(list length structure))

(define (left-branch mobile)
	(car mobile))

(define (right-branch mobile)
	(cadr mobile))

(define (branch-length branch)
	(car branch))

(define (branch-structure branch)
	(cadr branch))

; b
(define (branch-weight branch)
	(let ((s (branch-structure branch)))
		(if (not (pair? s))
			 s
			(total-weight s))))

(define (total-weight mobile)
	(+ (branch-weight (left-branch mobile)) 
	   (branch-weight (right-branch mobile))))

; c
(define (torque branch)
	(* (branch-length branch)
	   (branch-weight branch)))

(define (mobile-balance? mobile)
	(let ((left (left-branch mobile))
		  (right (right-branch mobile)))
	(and
		 (same-torque? left right)
		 (branch-balance? left)
		 (branch-balance? right))))

(define (same-torque? left right)
	(= (torque left)
	   (torque right)))

(define (branch-balance? branch)
	(if (pair? (branch-structure branch))
		(mobile-balanced? (branch-structure branch))
		#t))