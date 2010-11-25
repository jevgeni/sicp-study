#lang racket

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) null sequence))

(define (inc x)
  (+ x 1))

(map inc '(1 2 3 4))
(display "-------------------------------------\n")

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(append '(1 2 3) '(4 5 6))

(display "-------------------------------------\n")


; (op 1
;    (op 2 
;        (op 3
;            (op 4
;                (op 5
;                    0) -> 1)    
(define (length sequence)
  (accumulate  (lambda (x y) (inc y)) 0 sequence))

(length '(1 2 3 4 5))




