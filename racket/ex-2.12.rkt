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


;; excercise starts here
(define (make-center-percent a-center a-percent)
  (let ((lower (- a-center (* a-center (/ a-percent 100))))
        (upper (+ a-center (* a-center (/ a-percent 100)))))
    (make-interval lower upper)))

(= (lower-bound (make-center-percent 5 10)) 4.5)
(= (upper-bound (make-center-percent 5 10)) 5.5)


(define (percent i)
  (let ((w (width i))
        (c (center i)))
    (* (/ w c) 100)))

(= (percent (make-center-percent 5 12.5)) 12.5)
  