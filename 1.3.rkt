;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |1.3|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (bigSquare a b c)
  (cond
    ((and (> a c) (> b c)) (+ (* a a) (* b b)))
    ((and (> b a) (> c a)) (+ (* b b) (* c c)))
    ((and (> a b) (> c b)) (+ (* a a) (* c c)))
  )
  )
(bigSquare 3 4 5)
(bigSquare 5 6 3)
(bigSquare 7 4 8)