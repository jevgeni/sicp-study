#lang racket

(define (adjoin-set x set)
  (if (null? set)
      '()
      (cons (if (<= (car set) x)
                (car set)
                x)
            (adjoin-set x (cdr set)))))
  
  
  
  (adjoin-set 5 '(1 2 4 6 7)) ;=> (1 2 4 5 6)