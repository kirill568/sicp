#lang racket
(define (make-monitored funct)
  (define counter 0)
  (define (fm m)
     (cond
      ((eq? m 'how-many-calls?) counter)
      ((eq? m 'reset-count) (set! counter 0))
      (else (begin (set! counter (+ counter 1)) (funct m)))
      )
   )
  fm
  ) 

(define s (make-monitored sqrt))
(s 100)
(s 25)
(s 9)
(s 'how-many-calls?)
(s 'reset-count)
(s 25)
(s 'how-many-calls?)
