#lang racket

(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (inc n) (+ n 1))

(define (sum term a next b) (accumulate + 0 term a next b))
(define (product term a next b) (accumulate * 1 term a next b))

(define (self x) x)

; test sum
(= (sum self 0 inc 10) (+ 0 1 2 3 4 5 6 7 8 9 10))
(= (product self 1 inc 10) (* 1 2 3 4 5 6 7 8 9 10))

;; same, but recursive:

(define (accumulate-r combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-r combiner null-value term (next a) next b))))

(define (sum-r term a next b) (accumulate-r + 0 term a next b))
(define (product-r term a next b) (accumulate-r * 1 term a next b))

; testing recursive sum/product:
(= (sum-r self 0 inc 10) (+ 0 1 2 3 4 5 6 7 8 9 10))
(= (product-r self 1 inc 10) (* 1 2 3 4 5 6 7 8 9 10))
