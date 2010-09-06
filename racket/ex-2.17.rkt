#lang racket

(define (last-pair items)
  (let ((next (cdr items)))
    (if (null? next)
        items
        (last-pair next))))

(last-pair (list 23 72 149 34)) ;-> 34