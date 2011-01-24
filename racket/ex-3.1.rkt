#lang racket

(define (make-accumulator value)
  (lambda (amount)
    (begin (set! value (+ amount value))
           value)))

(define A (make-accumulator 5))

(A 10)

(A 10)