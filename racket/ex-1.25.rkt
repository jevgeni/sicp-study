#lang racket

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random 4294967087))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (sqr (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(= (next 2) 3)
(= (next 4) (+ 4 2))
(= (next 0) (+ 0 2))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (cond ((prime? n 5) (report-prime (- (current-inexact-milliseconds) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (iter a b)
  (timed-prime-test a)
  (search-for-primes (+ a 2) b))  

(define (search-for-primes a b)
  (cond ((<= a b)      
         (if (even? a) 
             (search-for-primes (+ a 1) b)
             (iter a b)))
        (else 0)))


;; the expmod get really big number and fails to calculate in a reasonable time :)