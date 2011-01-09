#lang racket

(define (make-from-mag-ang x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) (* x (cos y)))
          ((eq? op 'imag-part) (* x (sin y)))
          ((eq? op 'magnitude) x)
          ((eq? op 'angle) y)
          (else
           (error "Unknown op. -- MAKE-FROM-MAG-ANG" op))))
  dispatch)

(define (apply-generic op arg) arg op)

(define (real-part z) (apply-generic 'real-part z))