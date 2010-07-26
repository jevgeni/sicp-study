#lang racket

; Tpq (a, b) => T(bq + aq + ap, bp + aq)
; Tp'q' => T( (bp+aq)q + (bq + aq + ap)q + (bq + aq + ap)p,
;             (bp + aq)p + (bq + aq + ap)q )
; Tp'q' => T( qbp + aq^2 + bq^2 + aq^2 + aqp + pbq + aqp + ap^2, ...)
; Tp'q' => T( b*(2qp + q^2) + a*(q^2 + 2qp) + a*(q^2 + p^2), ...)
; ==> 
; q' = (2qp + q^2)
; p' = (q^2 + p^2)

; now checking :)

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (* q q) (* p p)) ; вычислить p’
                   (+ (* 2 q p) (* q q)) ; вычислить q’
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))