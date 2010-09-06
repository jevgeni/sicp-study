#lang racket

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))


; a: selectors
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cadr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cadr branch))

; b: total-weight
(define (mobile? item)
  (pair? item))

(define (total-weight structure)
  (if (not (mobile? structure)) structure
  (+ (total-weight (branch-structure (left-branch structure)))
     (total-weight (branch-structure (right-branch structure))))))

(define br1 (make-branch 14 5))
(define br2 (make-branch 5 2))
(define br3 (make-branch 10 (make-mobile br1 br2)))
(define br4 (make-branch 10 (make-mobile br1 br1)))

(define m (make-mobile br1 br3))

(total-weight m) ;-> 5 + 2 + 5 -> 12

; c: mobile-balanced?
(define (mobile-balanced? mobile)
  (define (torque branch)
    (* (branch-length branch) (total-weight (branch-structure branch))))
  (if (mobile? mobile) 
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (and (= (torque left) (torque right)) 
             (mobile-balanced? (branch-structure left))
             (mobile-balanced? (branch-structure right))))
      true))


(mobile-balanced? (make-mobile br1 br1)) ;-> true
(mobile-balanced? (make-mobile br4 br4)) ;-> true
(mobile-balanced? m) ;-> must be false

; d: data representation is changed in make-mobile and make-branch.
; the only functions needed to be changed are selectors: left-branch/right-branch/branch-length/branch-structure