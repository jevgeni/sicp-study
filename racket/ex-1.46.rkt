#lang racket


(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (let ((next (improve guess)))
      (if (good-enough? guess next)
          next
          (iter next))))
  iter)

(define (average x y)
  (/ (+ x y) 2))


(define (sqrt x)
  ((iterative-improve (lambda (guess next)
                        (< (abs (- (sqr guess) x)) 0.00001))
                      (lambda (guess)
                        (average guess (/ x guess)))) 1.0))
(sqrt 9)

(define (fixed-point f x)
  ((iterative-improve (lambda (guess next)
                        (< (abs (- guess next)) 0.00001))
                      f)
                      x))

(fixed-point cos 1.0)