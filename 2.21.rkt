#lang racket
(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items))
            (square-list (cdr items)))
      )
  )
(square-list (list 1 2 3 4 5))

(define (square-list2 items)
  (map (lambda (x) (* x x)) items)
  )

(square-list2 (list 1 2 3 4 5))