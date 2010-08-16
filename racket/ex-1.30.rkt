#lang racket

(define (sum-r term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum-r term (next a) next b))))


(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
  
  (iter a 0))

(define (inc x) (+ x 1))

(= (sum-r sqr 1 inc 10) (sum sqr 1 inc 10))