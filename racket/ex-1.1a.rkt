#lang racket
;
;(require rackunit)
;
;
;(define 
;  (sum-of-max-squares a b c)
;  (define (sum-of-squares a b) (+ (sqr a) (sqr b)))
;  (cond 
;    ((and (>= a c) (>= b c)) (sum-of-squares a b))
;    ((and (>= a b) (>= c b)) (sum-of-squares a c))
;    ((and (>= b a) (>= c a)) (sum-of-squares b c))))
;
;
;
;(check-equal? (sum-of-max-squares 1 2 3) 13)
;(check-equal? (sum-of-max-squares 4 4 4) 32)



;---------------
;
;(define (new-if predicate then-clause else-clause)
;  (cond (predicate then-clause)
;        (else else-clause)))
;
;(new-if (= 2 3) 0 5)
;
;(new-if (= 1 1) 0 5)


;(define (sqrt-iter guess x)
;  (new-if (good-enough? guess x)
;         guess
;          (sqrt-iter (improve guess x)
;                     x)))



