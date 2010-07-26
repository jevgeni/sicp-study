#lang racket

;; first function
(+ 3 4)
(inc (+ (dec 3) 4))
(inc (+ 2 4))
(inc (inc (+ (dec 2) 4)))
(inc (inc (+ 1 4)))
(inc (inc (inc (+ (dec 1) 4))))
(inc (inc (inc (+ 0 4))))
(inc (inc (inc 4)))
(inc (inc 5))
(inc 6)
7
;; this is recursive process


(+ 3 4)
(+ (dec 3) (inc 4))
(+ 2 5)
(+ (dec 2) (inc 5))
(+ 1 6)
(+ (dec 1) (inc 6))
(+ 0 7)
7
;; this is iterative process
