#lang racket

(define tolerance 0.0001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display guess)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; testing sqr
;(fixed-point (lambda (y) (/ (+ y (/ 9 y)) 2)) 1.0)


; excercise to find x^x = 1000
; x -> log(1000)/log(x)

(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1) ; takes 32 steps

; with average damping
; x + x -> log(1000)/log(x) + x
; x -> (log(1000)/log(x))/2 + x/2
; x -> log(1000)/2log(x) + x/2

(fixed-point (lambda (x) (+ (/ (log 1000) (* 2 (log x))) 
                            (/ x 2)))
             1.1) ; takes 13 steps

; f with average damping is faster
