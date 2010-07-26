#lang racket

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))


(define (* x y)
  (define (*-iter a x y)
    (if (= y 0) a
        (cond ((even? y) (*-iter a (double x) (halve y)))
              (else (*-iter (+ a x) x (- y 1))))))
  (*-iter 0 x y))

(* 8 4)
(* 2 7)
(* 4 123)

; invariant: a + bn
; a1 + b1 n1 = a2 + b2 n2
;; for even:
; a1 + b1 n1 = a2 + b2 (n1 / 2)
; assume a1 = a2
; b1 n1 = b2 (n1 / 2)
; b2 = (b1 n1) / (n1 / 2)
; b2 = double b1

;; for non-even:
; a1 + b1 n1 = a2 + b2 (n1 - 1)
;; assume b1 = b2
; a1 + b1 n1 = a2 + b1 (n1 - 1)
; a1 + b1 n1 = a2 + b1 n1 - b1
; a1 = a2 - b1
; a2 = a1 + b1