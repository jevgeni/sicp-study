#lang racket

;; take as a sample

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))))
    
  (iter a 0))

;; define ex. product func:
  
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
      
  (iter a 1))

(define (product-r term a next b)
    (if (> a b)
        1
        (* (term a)
           (product-r term (next a) next b))))

    
;; how can we calculate the factorial with product function?
(define (inc n) (+ n 1))  
  
(define (self x) x)
  
(define (factorial n)
  (product self 1 inc 10))
  
(= (factorial 10) (* 1 2 3 4 5 6 7 8 9 10))
  
;; how do we calculate the PI? 

; define the term
; k = 0 => 2 / 3 
; k = 1 => 4 / 3
; k = 2 => 4 / 5
; k = 3 => 6 / 5
; k = 4 => 6 / 7
; k = 5 => 8 / 7
; k = 6 => 8 / 9
; k = 7 => 10 / 9

(define (pi n)
  (define (pi-term k)
    (cond ((odd? k) (/ (+ k 3) (+ k 2)))
          (else (/ (+ k 2) (+ k 3)))))
  (* 1 (product pi-term 0 inc n)))

(define (pi-r n)
  (define (pi-term k)
    (cond ((odd? k) (/ (+ k 3) (+ k 2)))
          (else (/ (+ k 2) (+ k 3)))))
  (* 1 (product-r pi-term 0 inc n)))