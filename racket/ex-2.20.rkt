#lang racket

(define (same-parity check-number . items)
  (define (same-parity? x y)
    (or (and (even? x) (even? y))
        (and (odd? x) (odd? y))))
  ; main body
  (define (build-list items) 
    (if (null? items)
        null
        (let ((number (car items))
              (rest (cdr items)))
          (if (same-parity? check-number number)
              (cons number (build-list rest))
              (build-list rest)))))
    (build-list (cons check-number items)))

(same-parity 1)
'(1)
(same-parity 1 2 3 4 5 6 7)
'(1 3 5 7)
(same-parity 2 3 4 5 6 7)
'(2 4 6)