#lang racket

(require rackunit)

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
    guess
    (sqrt-iter (improve guess x)
               x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess new-guess)
  (< (abs (- guess new-guess)) 0.0001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;----------- excercise
; test would be comparing 2 implementations. The second one could be more accurate.

; ------- excercise 1.8
(define (cube-root x)
  (cube-iter 1.0 x))

(define (cube-iter guess x)
  (if (good-enough? guess (cube-improve guess x))
      guess
      (cube-iter (cube-improve guess x) x)))

(define (cube-improve guess x) 
  (/ (+ (/ x (sqr guess))
        (* 2 guess))
     3))


(check-= (cube-root 27) 3 0.0001)

(check-= (cube-root 0.000001) 0.01 0.0001)

;; -------------------------------
;; ----- excercise 1.9



