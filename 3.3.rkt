#lang racket
(define (make-account balance password)
  (define (withdraw amount pass)
    (if ((and (>= balance amount) (eq? pass password)))
        (begin (set? balance (- balance amount))
               balance)
        "hot have money"
        )
    )
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance
    )
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit))
    )
  dispatch
  )
