#lang racket
(define (inc x)
  (+ x 1))
   
;; excercise
(define (compose f g)
  (lambda (x) (f (g x))))

((compose sqr inc) 6); -> 49