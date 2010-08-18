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


;; iterative function
(define (cont-frac-i n d k)
  (define (iter i result)
    (cond ((= i 0) result)
          (else (iter (- i 1)
                      (/ (n i) (+ (d i) result))))))
  (iter (- k 1) (/ (n k) (d k))))


(cont-frac-i (lambda (i) 1.0)
             (lambda (i) 1.0)
             11) ; k = 11; to get 0.0001 precious