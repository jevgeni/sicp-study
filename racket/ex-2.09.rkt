#lang racket

; liza's program
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

;; excercise to show that sum of interval radiuses is the interval radiuses sum. 
;; Show that this is not applicable for mul/div

(define (radius i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

(radius (make-interval 3 11)) ;-> 4

; these are equal:
(+ (radius (make-interval 3 11)) (radius (make-interval 10 12)))
(radius (add-interval (make-interval 3 11) (make-interval 10 12)))

; why? 
; (radius (add-interval I1[a1, b1] I2[a2, b2]))
; (radius (make-interval (+ (lower-bound x) (lower-bound y))
;                 (+ (upper-bound x) (upper-bound y))))
;
; (radius I[(a1 + a2), (b1 + b2)])
; 
; ((b1 + b2) - (a1 + a2)) / 2
;
; --
; (radius I1[a1, b1]) + (radius I2[a2, b2])
;
; (b1 - a1) / 2 + (b2 - a2) / 2
; (b1 - a1 + b2 - a2) / 2
; ((b1 + b2) - (a1 + a2)) / 2
;
; same is possible to show for neg.
; 
; for multiple you cannot do like this, because there is a multiplication, while radius does not have
; it so the formula will not be equivalent


