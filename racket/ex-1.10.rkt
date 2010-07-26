#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
(A 0 (A 0 (A 0 (A 0 (A 1 6)))))
....
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 1))))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 2)))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 4))))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 (A 0 8)))))))
(A 0 (A 0 (A 0 (A 0 (A 0 (A 0 16))))))
(A 0 (A 0 (A 0 (A 0 (A 0 32)))))
(A 0 (A 0 (A 0 (A 0 64))))
(A 0 (A 0 (A 0 128)))
(A 0 (A 0 256))
(A 0 512)
1024

;;;;
(A 2 4)
(A 1 (A 2 3))
(A 1 (A 1 (A 2 2)))
(A 1 (A 1 (A 1 (A 2 1))))
(A 1 (A 1 2^2))

(A 1 (A 1 4))
(A 1 2^4)
(2^16)
;;------------------------------
(A 0 0) -> 0
(A 0 1) -> 2
(A 0 2) -> 4
(A 0 3) -> 6
(A 0 4) -> 8

(A 0 y) -> f = 2y

(A 1 0) -> 0
(A 1 1) -> 2
(A 1 2) -> (A 0 (A 1 1)) -> (A 0 2) -> 4
(A 1 3) -> (A 0 (A 1 2))) -> (A 0 4) -> 8
(A 1 4) -> 16
(A 1 y) -> f = 2^y = 2 * 2 * 2 ...

(A 2 0) -> 0
(A 2 1) -> 2 
(A 2 2) -> 4
(A 2 3) -> 16 
(A 2 4) -> 65536
(A 2 5) -> 2 ^ 2 ^ y


2^2^y