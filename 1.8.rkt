;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.8|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (goodCube y x)
  (/ (+ (/ x (* y y)) (* 2 y))3)
  )

(define (goodEnough? guess preGuess)
  (< (/ (abs(- guess preGuess)) preGuess) 0.001)
 )

(define (cubeIter guess preGuess x)
  (if (goodEnough? guess preGuess)
      guess
      (cubeIter (goodCube guess x) guess x)
      )
 )

(define (cube x)
  (cubeIter 1 0.1 x)
 )

(cube 500)



