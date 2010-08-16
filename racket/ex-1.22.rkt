#lang racket

(define (timed-prime-test n)
(newline)
(display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
(cond ((prime? n) (report-prime (- (current-inexact-milliseconds) start-time)))))

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
            (iter a b)))
        (else 0)))

(define (prime? n)
  (= n (smallest-divisor n)))


(search-for-primes 10000000000 10000000100)