;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.4|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (aPlusAbsb a b)
  ((if (> b 0) + -) a b))
(aPlusAbsb 3 4)
(aPlusAbsb 3 -2)