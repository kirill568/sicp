#lang racket
(define (make-accumulator start)
    (lambda (count) (begin
                      (set! start (+ start count))
                      start))
  )

(define A (make-accumulator 5))
(A 10)
(A 15)