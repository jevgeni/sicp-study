#lang racket

(define (*0 a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))


(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))


(define (* a b)
  (if (= b 0)
      0
      (cond ((even? b) (double (* a 
                                  (halve b))))
            (else (+ a 
                     (* a 
                        (- b 1)))))))

(define (*2 a b)
  (if (= b 0)
      0
      (cond ((even? b) (double (* a 
                                  (halve b))))
            (else (+ a 
                     (double (* a 
                                (halve (- b 1)))))))))

(*0 8 4)
(*0 2 7)
(*0 4 123)

(* 8 4)
(* 2 7)
(* 4 123)

(*2 8 4)
(*2 2 7)
(*2 4 123)

;2 + 2 + 2 + 2

;(* 2 4) = 
;(+ 2 (* 2 3)) = 
;(+ 2 (+ 2 (* 2 2))) = 
;(+ 2 (+ 2 (+ 2 (* 2 1)))) =
;(+ 2 (+ 2 (+ 2 (+ 2 (* 2 0)))))=
;(+ 2 (+ 2 (+ 2 (+ 2 0)))) = 8
