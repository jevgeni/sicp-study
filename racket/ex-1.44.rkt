#lang racket

(define (compose f g)
  (lambda (x) (f (g x))))

(define (identity x) x)

(define (repeated f n)
  (if (= n 0)
      identity
      (compose f (repeated f (- n 1)))))

;; excercise

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f (- x dx))
                    (f x)
                    (f (+ x dx)))
                 3)))

((smooth sqr) 3) ; just for testing that smooth is working

(define (n-smooth f n)
  ((repeated smooth n) f))

; example
((n-smooth sqr 5) 3) 



