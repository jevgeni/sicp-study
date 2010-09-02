#lang racket

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

; exercise:
; 1) define one
; 2) define two
; 3) define +


;(add-1 zero)
;(lambda (f) (lambda (x) (f ((zero f) x))))
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;(lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

; (add-1 one)
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) (f x)) x))))
;(lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

(define (inc x) (+ x 1))

((zero inc) 0) ;-> 0
((one inc) 0) ;-> 1
((two inc) 0) ;-> 2

(define (plus a b) (lambda (f) (lambda (x) ((b f) ((a f) x)))))

(((plus one two) inc) 0) ;-> 3

(((plus two two) inc) 0) ;-> 4

(((plus two (plus two two)) inc) 0) ;-> 6



