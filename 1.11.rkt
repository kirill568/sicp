;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |1.11|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
(define (f n)
  (cond
    ((< n 3) n)
    ((>= n 3) (+ (f(- n 1)) (f(- n 2)) (f(- n 3))))
    )
  )

(f 5)



(define (f-iter a b c count)
  (if (= count 0)
      c
      (f-iter (+ a b c) a b (- count 1))
      )
)
    
(define (f2 n)
  (f-iter (2 1 0 n))
  )

(f2 5)





