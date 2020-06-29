#lang sicp

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x
  )

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))
      )
  )

(define x (list 'a 'b))
(define y (list 'c 'd))
(last-pair x)
(append! x y)