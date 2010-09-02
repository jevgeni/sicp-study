#lang racket

; gcd
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; make-rat
; abs is important! GCD was tested to work with non-negative only.
(define (make-rat n d)
  (define (sign n)
    (if (< n 0) - +))
  (let ((g (gcd (abs n) (abs d)))
        (d-sign (sign d)))
    (cons (d-sign (/ n g))
          (d-sign (/ d g)))))


(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 3 6)) ; -> 1/2
(print-rat (make-rat -3 6)) ; -> -1/2
(print-rat (make-rat 3 -6)) ; -> -1/2
(print-rat (make-rat -3 -6)) ; -> 1/2