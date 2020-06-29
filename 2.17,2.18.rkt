#lang racket
(define (last-pair list)
  (if (null? (cdr list))
      (car list)
      (last-pair (cdr list))
      )
)

(last-pair (list 23 72 149 34))

(define (reverse list-my)
  (define (iter iter-list acc)
      (if (null? iter-list)
          acc
          (iter (cdr iter-list) (cons (car iter-list) acc))
          )
    )
  (iter list-my (list))
)

(reverse (list 23 72 149 34))   

