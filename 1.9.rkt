;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.9|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (inc a)
  (+ a 1)
)

(define (dec a)
  (- a 1)
  )

(define (plus a b)
  (if (= a 0)
      b
      (inc (plus (dec a) b))
      )
 )

(plus 2 3)

(define (plusTwo a b)
  (if (= a 0)
      b
      (plusTwo (dec a) (inc b))
      )
  )

(plusTwo 2 3)