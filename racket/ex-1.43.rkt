#lang racket

(define (compose f g)
  (lambda (x) (f (g x))))

;; excercise
(define (identity x) x)

(define (repeated f n)
  (if (= n 0)
      identity
      (compose f (repeated f (- n 1)))))

((repeated sqr 2) 5) ;-> 625