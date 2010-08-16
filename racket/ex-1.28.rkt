#lang racket

;; precondition data
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (!= x y)
  (not (= x y)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((and (!= base 1)
              (!= base (- m 1))
              (= (remainder (sqr base) m) 1)) 0)
        ((even? exp)
         (remainder (sqr (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test-2 n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fermat-test n)
  (define (iter a b)
    (if (or (equal? b false) (< a 1))
        b
        (iter (- a 1) (= (expmod a (- n 1) n) 1))))
  (iter (- n 1) true))

(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)

