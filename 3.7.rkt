#lang racket
(define (make-account balance password)
  (define (withdraw amount pass)
    (cond ((< balance amount) "not have money")
          ((not (eq? pass password)) "password is wrong")
          (else (begin (set! balance (- balance amount))
                        balance))
          )
    )
  (define (deposit amount pass)
    (if (eq? pass password)
        (begin (set! balance (+ balance amount))
               balance )
        "password is wrong"
        )
        )
  (define (give-pass pass)
    password
    )

  (define (pass-is-equal? pass)
    (if (eq? pass password)
        #t
        #f
        )
    )

  (define (set-pass new-pass pass)
    (if (eq? pass password)
        (set! password new-pass)
        "password is wrong"
        )
    )

  (define (give-balance pass)
    (if (eq? pass password)
        balance
        "password is wrong"
        )
    )
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          ((eq? m 'pass-is-equal?) pass-is-equal?)
          ((eq? m 'give-pass) give-pass)
          ((eq? m 'give-balance) give-balance)
          ((eq? m 'set-pass) set-pass))
    )
  dispatch
  )

(define (make-joint acc old-pass new-pass)
  (if ((acc 'pass-is-equal?) old-pass)
      (begin ((acc 'set-pass) new-pass old-pass)
              acc)
      "password is wrong"
      )
  )

(define A (make-account 100 '123kirkir))
((A 'deposit) 40 '123kirkir)
(define B (make-joint A '123kirkir '568top))
((B 'deposit) 120 '568top)
((A 'give-balance) '568top)
((B 'withdraw) 200 '568top)
((A 'give-balance) '568top)
















  