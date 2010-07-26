#lang racket
;Uzhas nah dlja Sashi
(define (f n)
  (cond (( < n 3) n)
        (else (+ (f (- n 1))
                 (f (- n 2))
                 (f (- n 3))))))
(define (f2 n)
  (f2-iter 0 1 2 n))

(define (f2-iter a b c count)
  (cond ((= count 0) a)
        (else (f2-iter b c (+ a b c) (- count 1)))))

(f2 10)