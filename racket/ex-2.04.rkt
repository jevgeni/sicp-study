#lang racket

(define (cons x y)
  (lambda (m) (m x y)))


(define (car z)
  (z (lambda (p q) p)))

;; excercise starts here
(define (cdr z)
  (z (lambda (p q) q)))

(car (cons 10 5)) ;-> 10
(cdr (cons 10 5)) ;-> 5
