#lang racket

;; for testing 
(define (smallest-divisor n)
  (find-divisor n 2))

(define (next test-divisor)
  (if (= test-divisor 2)
      3
      (+ test-divisor 2)))

(define (find-divisor n test-divisor)
  (cond ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; exercise

(define (filtered-accumulate combiner null-value term a next b filter?)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (if (filter? a)
                           (combiner result (term a))
                           result))))
  (iter a null-value))

(define (inc n) (+ n 1))

(define (identity x) x)

; a) test sum-prime
(define (sum-prime term a next b) (filtered-accumulate + 0 term a next b prime?))

(= (sum-prime identity 0 inc 10) (+ 1 2 3 5 7))

; b) gcd 
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))


(define (product-prime a b) 
  (define (prime-for-x? x)
    (not (= (gcd x b) 1)))
  (filtered-accumulate * 1 identity a inc b prime-for-x?))

(= (product-prime 1 5) (* 1 5))


