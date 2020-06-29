;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname test1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (square x) (* x x))

(define preGuess 0)

(define (improve guess x)
  (average guess (/ x guess))
)

(define (average x y)
  (/ (+ x y) 2)
)

(define (good-enough? guess pre)
  (< (/ (abs(- guess pre)) pre) 0.001)
)

(define (sqrt-iter guess x pre)
  (cond
    ((good-enough? guess pre) guess)
    (else (sqrt-iter (improve guess x) x guess))
  )
)

(define (mySqrt x)
  (sqrt-iter 1.0 x 0.1)
)

(mySqrt 1000000000000000)
