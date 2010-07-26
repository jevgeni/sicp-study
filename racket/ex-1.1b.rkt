#lang racket

(require rackunit)

;;;; CHAPTER 1.1 exercises
"defining chapter functions"
(define (sum-of-squares x y)
  (+ (sqr x) (sqr y)))

"excercise 1.1"
(define a 3) ; -> nothing! (but a = 3)
(define b (+ a 1)) ; -> nothing! (but b = 4)

(test-case "excercise 1.1"
           (check-equal? 0 0)
           (check-equal? (+ 5 3 4) 12)
           (check-equal? (- 9 1) 8)
           (check-equal? (/ 6 2) 3)
           (check-equal? (+ (* 2 4) (- 4 6)) 6)
           
           (check-equal? (+ a b (* a b)) 19)
           (check-equal? (= a b) #f)
           
           (check-equal? (if (and (> b a) (< b (* a b)))
                             b
                             a)
                         4)
           
           (check-equal? (cond ((= a 4) 6)
                               ((= b 4) (+ 6 7 a))
                               (else 25))
                         16)
           
           (check-equal? (+ 2 (if (> b a) b a))
                         6)
           
           (check-equal? (* (cond ((> a b) a)
                                  ((< a b) b)
                                  (else -1))
                            (+ a 1))
                         16))

"=========================================================="
"excercise 1.2"
;5 + 4 + (2 − (3 − (6 + 4/5)))
;---------------
;3(6 − 2)(2 − 7)

(test-case "excercise 1.2"
           (check-equal? (/ (+ 5 4 (- 2 (- 3 (+ 6 4/5))))
                            (* 3 (- 6 2) (- 2 7)))
                         -37/150))
"=========================================================="
"excercise 1.3"
(define (square-sum-of-two-max a b c)
  (cond ((and (<= a b) (<= a c)) (sum-of-squares b c))
        ((and (<= b a) (<= b c)) (sum-of-squares a c))
        ((and (<= c a) (<= c b)) (sum-of-squares a b))))

(test-case "excercise 1.3"
           (check-equal? (square-sum-of-two-max 1 2 3) (sum-of-squares 2 3))
           (check-equal? (square-sum-of-two-max 2 1 3) (sum-of-squares 2 3))
           (check-equal? (square-sum-of-two-max 2 3 1) (sum-of-squares 2 3))
           (check-equal? (square-sum-of-two-max 5 5 3) (sum-of-squares 5 5))
           (check-equal? (square-sum-of-two-max 5 3 3) (sum-of-squares 5 3))
           (check-equal? (square-sum-of-two-max 5 5 5) (sum-of-squares 5 5)))

"=========================================================="
"excercise 1.4"
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(test-case "excercise 1.4"
          (check-equal? (a-plus-abs-b 1 2) 3)
          (check-equal? (a-plus-abs-b 1 -4) 5))

"=========================================================="
"excercise 1.5"
(define (p) (p))
(define (test x y)
  (if (= x 0)
    0
    y))
"if applicative, then (test 0 (p)) will expand to:
(test 0 (p)) and will loop...
In normal it will expand to:
(if (= 0 0) 0 (p))
->
(if #t 0 (p))
-> 0
"
















