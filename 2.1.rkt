#lang racket
(define (make-rat n d)
  (cond ((and (< n 0) (> d 0)) (cons n d)) 
        ((and (< n 0) (< d 0)) (cons n (abs d)))
        ((and (> n 0) (< d 0)) (cons (* -1 n) (abs d)))
        (else (cons n d))
        )
  )

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y)))
  )

(define one (make-rat -2 -3))
(define two (make-rat 1 2))

(print-rat (mul-rat one two))