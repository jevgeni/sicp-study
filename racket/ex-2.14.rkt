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

; div must check interval which cross the zero
(define (div-interval x y)
  (if (and (<= (lower-bound y) 0)
           (>= (upper-bound y) 0))
      (error "second interval crosses the zero")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (car interval))
(define (upper-bound interval) (cdr interval))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent a-center a-percent)
  (let ((lower (- a-center (* a-center (/ a-percent 100))))
        (upper (+ a-center (* a-center (/ a-percent 100)))))
    (make-interval lower upper)))

(define (percent i)
  (let ((w (width i))
        (c (center i)))
    (* (/ w c) 100)))

; Daiko's turn
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

; checking if he is right..
(define A (make-center-percent 10 0.5))
(define B  (make-center-percent 20 0.5))
(center (par1 A B))
(percent (par1 A B))
(newline)
(center (par2 A B))
(percent (par2 A B))
(newline)
(center (div-interval A A))
(percent (div-interval A A))
(newline)
(center (div-interval A B))
(percent (div-interval A B))

; if the percent is bigger, the bigger is difference. Par2 is more precise, at the same time.

;; oh yes. :(
; let's check 
