#lang racket
(define (union-set set1 set2)
  (if (null? set1)
      set2
      (let (
            (x1 (car set1))
            (x2 (car set2))
            )
        (cond
          ((= x1 x2)
           (cons x1
                 (union-set (cdr set1) (cdr set2))))
          ((> x1 x2) (cons x2 (union-set set1 (cdr set2))))
          ((> x2 x1) (cons x1(union-set (cdr set1) set2)))
          )
        )
      )
  )

(union-set (list 1 3 5 6 7 8) (list 1 2 4 5 6 7 8 9 10))

(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      null
      (let (
            (x1 (car set1))
            (x2 (car set2))
            )
        (cond
          ((= x1 x2)
           (cons x1
                 (intersection-set (cdr set1) (cdr set2))))
          ((< x1 x2) (intersection-set (cdr set1) set2))
          ((< x2 x1) (intersection-set set1 (cdr set2)))
          )
        )
      )
  )

(intersection-set (list 1 3 5) (list 1 2 4 5))