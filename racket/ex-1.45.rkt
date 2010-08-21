#lang racket

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point (lambda (y) (average y (/ x y)))
               1.0))

; repeated stuff

(define (compose f g)
  (lambda (x) (f (g x))))

(define (identity x) x)

(define (repeated f n)
  (if (= n 0)
      identity
      (compose f (repeated f (- n 1)))))

(define (n-root x n)
  (fixed-point 
   ((repeated average-damp (floor (log2 n)))
              (lambda (y) (/ x (expt y (- n 1)))))
    1.0))
  
  ;; freezes at | average-damp a
  ;; 4          |  1
  ;; 8          |  2
  ;; 16         |  3
  ;; 32         |  4
  ;; freezes at log2(a)
  ;; log2(a) = log(a)/log(2)
  (define (log2 a)
    (/ (log a) (log 2)))
  
  ;; testing
  
  (n-root (expt 10 32) 32)
  (n-root (expt 10 100) 100)