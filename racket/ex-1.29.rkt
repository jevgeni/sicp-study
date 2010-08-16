#lang racket

(define (inc n) (+ n 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simson-integral f a b n)
  (define h (/ (- b a) n))
  (define (y k) 
    ( *
      (cond ((or (= k n) (= k 0)) 1)
            ((even? k) 2)
            (else 4))          
      (f (+ a (* k h)))))
  
  (* (/ h 3) (sum y 0 inc n)))

(define (cube x) (* x x x))


(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2)) add-dx b)
     dx))


(simson-integral cube 0 1 100)
(simson-integral cube 0 1 1000)
(integral cube 0 1 0.01)
(integral cube 0 1 0.001)