#lang racket

;; recursive function
(define (cont-frac n d k)
  (define (iter i)
    (cond ((= i k) (/ (n i) (d i)))
          (else (/ (n i) (+ (d i) (iter (+ i 1)))))))
  (iter 1))

(display "1 / golden-ratio: ")
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11) ; k = 11; to get 0.0001 precious


(define (tan-cf r k)
  (cont-frac (lambda (x) (if (= x 1) r (* r r)))
             (lambda (x) (+ 1.0 (* 2.0 (- x 1.0))))
             k))

(display "tan-cf: ")
(tan-cf 45 25) ; -> tan 45 degree = 1