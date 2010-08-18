#lang racket

;; recursive function
(define (cont-frac n d k)
  (define (iter i)
    (cond ((= i k) (/ (n i) (d i)))
          (else (/ (n i) (+ (d i) (iter (+ i 1)))))))
  (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ; k = 11; to get 0.0001 precious

; i->d(i)
; 1->1
; 2->2
; 3->1
; 4->1
; 5->4
; 6->1
; 7->1
; 8->6
; etc

(define (D-e i)
  (if (= (remainder (- i 2) 3) 0)  
      (+ 2 (* (/ (- i 2) 3) 2))
      1))

(define (calc-e)
  (+ 2 (cont-frac (lambda (x) 1.0)
                  D-e
                  10)))

(display "calc-e: ")
(calc-e)