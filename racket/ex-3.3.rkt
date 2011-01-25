#lang racket

(define (make-account balance acc-password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient fonds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch password m)
    (if (eq? password acc-password)
        (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "uknown method -- MAKE-ACCOUNT"
                       m)))
        (error "Incorrect password!")))
  dispatch)

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)

((acc 'some-other-password 'deposit) 50)