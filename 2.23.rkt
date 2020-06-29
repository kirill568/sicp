#lang racket
(define (my-for-each proc items)
     (cond ((not (null? items))
            (proc (car items)) (my-for-each proc (cdr items)))
     )    
)

(my-for-each (lambda (x) (display x))
             (list 1 2 3 4))