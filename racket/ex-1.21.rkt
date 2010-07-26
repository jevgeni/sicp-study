#lang racket

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
        (report-prime (- (current-inexact-milliseconds) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (iter a b)
  (timed-prime-test a)
  (search-for-primes (+ a 2) b))  

(define (search-for-primes a b)
  (cond ((<= a b)      
        (if (even? a) 
            (search-for-primes (+ a 1) b)
            (iter a b)))))

(define (prime? n)
  (= n (smallest-divisor n)))

; (search-for-primes 1000 2000) --> 0 msec for all three
; (search-for-primes 10000 11000) --> 0 msec for all three
; (search-for-primes 100000 101000) --> 0 msec for all three
; (search-for-primes 1000000 1001000) --> 0-1 msec for all three
; (search-for-primes 1000000000 1000000100) -> 4-5 msec
; (search-for-primes 10000000000 10000000100) -> ~90 msec
; (search-for-primes 100000000000 100000000100) -> 322 msec
; 322 / 90 ~ (sqrt 10)

