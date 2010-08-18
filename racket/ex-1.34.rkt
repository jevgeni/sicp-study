#lang racket

(define (f g)
  (g 2))

(f sqr) ; -> 4

(f (lambda (z) (* z (+ z 1)))) ; -> 6

(f f) ; -> error of procedure application in (g 2). Evaluation gets like this: (f f) > (f 2) -> (2 2) -> fail.
