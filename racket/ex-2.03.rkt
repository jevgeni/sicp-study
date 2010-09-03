#lang racket

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; print
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))


; mid-point
(define (average x y)
  (/ (+ x y) 2))

(define (midpoint-segment s)
  (let ((start (start-segment s))
        (end (end-segment s)))
    (make-point (average (x-point start) (x-point end))
                (average (y-point start) (y-point end)))))

;; exercise begins here
;; define rectangle
(define (make-rectangle p1 p2)
  (cons p1 p2))

(define (rectangle-width r)
  (let ((p1 (car r))
        (p2 (cdr r)))
    (abs (- (x-point p1) (x-point p2)))))

(define (rectangle-height r)
  (let ((p1 (car r))
        (p2 (cdr r)))
    (abs (- (y-point p1) (y-point p2)))))

; perimeter/square
(define (perimeter r)
  (* 2 (+ (rectangle-width r) (rectangle-height r))))

(define (square r)
  (* (rectangle-width r) (rectangle-height r)))

(define r1 (make-rectangle (make-point 0 0) (make-point 5 7)))

(= (perimeter r1) 24)
(= (square r1) (* 5 7))

;;; NOW THE SAME IMPLEMENTATION, BUT DIFFERENT REPRESENTATION
;; define rectangle (different representation)
(define (make-rectangle2 p1 width height)
  (cons p1 (cons width height)))

(define (rectangle-width2 r)
  (cadr r))

(define (rectangle-height2 r)
  (cddr r))

; perimeter/square -- same implementation 
(define (perimeter2 r)
  (* 2 (+ (rectangle-width2 r) (rectangle-height2 r))))

(define (square2 r)
  (* (rectangle-width2 r) (rectangle-height2 r)))
; ----------------------------------------------------

(define r2 (make-rectangle2 (make-point 0 0) 5 7))

(= (perimeter2 r2) 24)
(= (square2 r2) (* 5 7))


