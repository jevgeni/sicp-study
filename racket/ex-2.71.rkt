#lang racket

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "error bit -- CHOOSE-BRANCH" bit))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
        ((element-of-set? symbol (symbols (left-branch tree))) (cons 0 (encode-symbol symbol (left-branch tree))))
        ((element-of-set? symbol (symbols (right-branch tree))) (cons 1 (encode-symbol symbol (right-branch tree))))
        (else (error "error symbol -- CHOOSE-EXISTING-SYMBOL-IN-TREE " symbol))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set)
                    (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))



(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge tree) 
  (if (null? (cdr tree)) (car tree)
      (let ((merged-tree (make-code-tree (car tree) (cadr tree))))
        (successive-merge (adjoin-set merged-tree (cddr tree))))))

;; excercise

(define n5-tree (generate-huffman-tree '((N1 1) (N2 2) (N3 4) (N4 8) (N5 16))))
(length (encode-symbol 'N5 n5-tree)) ; 1 bit needed for the most common N
(length (encode-symbol 'N1 n5-tree)) ; N-1 bit needed for the least common N

(define n10-tree (generate-huffman-tree '((N1 1) (N2 2) (N3 4) (N4 8) (N5 16) (N6 32) (N7 64) (N8 128) (N9 256) (N10 512))))
(length (encode-symbol 'N10 n10-tree)) ; 1 bit needed for the most common N
(length (encode-symbol 'N1 n10-tree)) ; N-1 bit needed for the least common N

