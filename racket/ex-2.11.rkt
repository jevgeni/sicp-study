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

(define (radius i)
  (/ (- (upper-bound i) (lower-bound i))
     2))

; possible sign combinations
; -- -- 
; -- -+
; -- +- : impossible (lower is greated than upper)
; -- ++
; -+ --
; -+ -+ 
; -+ +- : impossible
; -+ ++
; +- -- : impossible
; +- -+ : impossible
; +- +- : impossible
; +- ++ : impossible
; ++ -- 
; ++ -+ 
; ++ +- : impossible
; ++ ++
;
; therefore possible 9 combinations are:
; -- -- : [(upper x)(upper y), (lower x)(lower y)]
; -- -+ : [(lower x)(upper y), (lower x)(lower y)]
; -- ++ : [(lower x)(upper y), (upper x)(lower y)]
; -+ -- : [(upper x)(lower y), (lower x)(lower y)]
; -+ -+ : [(upper x)(lower y) or (lower x)(upper y), (lower x)(lower y) or (upper x)(upper y)]
; -+ ++ : [(lower x)(upper y), (upper x)(upper y)]
; ++ -- : [(upper x)(lower y), (lower x)(upper y)]
; ++ -+ : [(upper x)(lower y), (upper x)(upper y)]
; ++ ++ : [(lower x)(lower y), (upper x)(upper y)]

; there are 3 combinations of signs per interval:
; -- (-1)
; -+ (0)
; ++ (1)

(define (mul-interval-new x y)
  ; sign detection function
  (define (sign interval)
    (let ((lower (lower-bound interval))
          (upper (upper-bound interval)))
      (cond ((and (< lower 0) (< upper 0)) -1)
            ((and (< lower 0) (>= upper 0)) 0)
            ((and (>= lower 0) (>= upper 0)) 1))))
  ; main body
  (let ((lo-x (lower-bound x))
        (up-x (upper-bound x))
        (lo-y (lower-bound y))
        (up-y (upper-bound y))
        (sign-x (sign x))
        (sign-y (sign y)))
    (cond ((< sign-x 0) 
           (cond ((< sign-y 0) (make-interval (* up-x up-y) (* lo-x lo-y)))
                 ((= sign-y 0) (make-interval (* lo-x up-y) (* lo-x lo-y)))
                 ((> sign-y 0) (make-interval (* lo-x up-y) (* up-x lo-y)))))
          ((= sign-x 0)
           (cond ((< sign-y 0) (make-interval (* up-x lo-y) (* lo-x lo-y)))
                 ((= sign-y 0) (let ((lo-1 (* up-x lo-y))
                                     (lo-2 (* lo-x up-y))
                                     (up-1 (* lo-x lo-y))
                                     (up-2 (* up-x up-y)))
                                 (make-interval (min lo-1 lo-2) (max up-1 up-2))))
                 ((> sign-y 0) (make-interval (* lo-x up-y) (* up-x up-y)))))
          ((> sign-x 0)
           (cond ((< sign-y 0) (make-interval (* up-x lo-y) (* lo-x up-y)))
                 ((= sign-y 0) (make-interval (* up-x lo-y) (* up-x up-y)))
                 ((> sign-y 0) (make-interval (* lo-x lo-y) (* up-x up-y)))))
           )))

;; tests
; -- --
(equal? (mul-interval-new (make-interval -3 -1) (make-interval -5 -2))
        (mul-interval (make-interval -3 -1) (make-interval -5 -2)))

; -- -+
(equal? (mul-interval-new (make-interval -3 -1) (make-interval -5 2))
        (mul-interval (make-interval -3 -1) (make-interval -5 2)))

; -- ++
(equal? (mul-interval-new (make-interval -3 -1) (make-interval 2 5))
        (mul-interval (make-interval -3 -1) (make-interval 2 5)))

; -+ --
(equal? (mul-interval-new (make-interval -3 1) (make-interval -5 -2))
        (mul-interval (make-interval -3 1) (make-interval -5 -2)))

; -+ -+
(equal? (mul-interval-new (make-interval -3 1) (make-interval -5 2))
        (mul-interval (make-interval -3 1) (make-interval -5 2)))

; -+ ++
(equal? (mul-interval-new (make-interval -3 1) (make-interval 2 5))
        (mul-interval (make-interval -3 1) (make-interval 2 5)))

; ++ --
(equal? (mul-interval-new (make-interval 1 3) (make-interval -5 -2))
        (mul-interval (make-interval 1 3) (make-interval -5 -2)))

; ++ -+
(equal? (mul-interval-new (make-interval 1 3) (make-interval -5 2))
        (mul-interval (make-interval 1 3) (make-interval -5 2)))

; ++ ++
(equal? (mul-interval-new (make-interval 1 3) (make-interval 2 5))
        (mul-interval (make-interval 1 3) (make-interval 2 5)))
