#lang racket

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car z)
  (if (> (remainder z 2) 0)
      0
  (+ 1 (car (/ z 2)))))


(define (cdr z)
  (if (> (remainder z 3) 0)
      0
  (+ 1 (cdr (/ z 3)))))


(car (cons 5 2)) ; -> 5
(cdr (cons 5 2)) ; -> 2