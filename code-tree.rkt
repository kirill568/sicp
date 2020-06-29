#lang racket
(define (make-leaf symbol weight)
  (list 'leaf symbol weight)
  )

(define (leaf? object)
  (eq? (car object) 'leaf)
  )

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right)))
  )

(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree))
  )

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree))
  )

(define A (make-leaf 'A 8))
(define B (make-leaf 'B 3))
(define C (make-leaf 'C 1))
(define D (make-leaf 'D 1))
(define E (make-leaf 'E 1))
(define F (make-leaf 'F 1))
(define G (make-leaf 'G 1))
(define H (make-leaf 'H 1))

(define code-tree (make-code-tree A (make-code-tree (make-code-tree B (make-code-tree C D)) (make-code-tree (make-code-tree E F) (make-code-tree G H)))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
    '()
    (let ((next-branch (choose-branch (car bits) current-branch)))
      (if (leaf? next-branch)
          (cons (symbol-leaf next-branch)
                (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch))
      )
    )
    )
  (decode-1 bits tree)
  )
(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit -- CHOOSE-BRANCH" bit)))
  )


(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))
        )
  )

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let (
            (pair (car pairs))
            )
          (adjoin-set (make-leaf (car pair) (cdr pair))
                      (make-leaf-set (cdr pairs)))
          )
      )
  )

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set))))
  )


(define (encode-symbol symbol tree)
  (define (encode-symbol-1 symbol current-branch acc answer)
      (let ((result (if (eq? (symbol-leaf current-branch) symbol) acc answer)))
        (newline)
        (display result)
         (cond  ((leaf? current-branch) result)
                (else (encode-symbol-1 symbol (left-branch current-branch) (cons 0 acc) result)
                      (encode-symbol-1 symbol (right-branch current-branch) (cons 1 acc) result))
       )
        )
          
   )
  (if (element-of-set? symbol (symbols tree))
      (encode-symbol-1 symbol tree '() '(12))
      (error "not exists symbol" symbol)
      )
  )

(encode-symbol 'F code-tree) 

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))
      )
  )





























