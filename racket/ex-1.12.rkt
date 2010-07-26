#lang racket

(require rackunit)

(define (pascal row n) 
  (define (dec n) 
    (- n 1))
  (cond ((< row 3) 1)
        ((or (= n 1) (= n row)) 1)
        (else (+ (pascal (dec row) (dec n)) 
                 (pascal (dec row) n)))))

(check-equal? (pascal 1 1) 1)
(check-equal? (pascal 2 1) 1)
(check-equal? (pascal 2 2) 1)
(check-equal? (pascal 3 2) 2)
(check-equal? (pascal 4 2) 3)
(check-equal? (pascal 4 3) 3)
(check-equal? (pascal 5 2) 4)
(check-equal? (pascal 5 3) 6)
(check-equal? (pascal 5 4) 4)
(check-equal? (pascal 5 5) 1)