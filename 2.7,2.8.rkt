#lang racket
(define (make-interval x y) (cons x y))

(define (lower-bound interval) (car interval))

(define (upper-bound interval) (cdr interval))


(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y)))
  )

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y)))
  )

(display (add-interval (make-interval 2 5) (make-interval 1 3)))
(display (sub-interval (make-interval 2 5) (make-interval 1 3)))