#lang racket

;; precondition data
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (sqr (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

;; solution
(define (fermat-test n)
  (define (iter a b)
    (if (or (equal? b false) (< a 0))
        b
        (iter (- a 1) (= (expmod a n n) a))))
  (iter (- n 1) true))

(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)


;; test