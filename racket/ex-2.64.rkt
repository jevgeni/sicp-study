#lang racket
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))


(define (list->tree elements) 
  (car (partial-tree elements (length elements)))) 
 
(define (partial-tree elts n) 
  (if (= n 0) 
      (cons '() elts) 
      (let ((left-size (quotient (- n 1) 2))) 
        (let ((left-result (partial-tree elts left-size))) 
          (let ((left-tree (car left-result)) 
                (non-left-elts (cdr left-result)) 
                (right-size (- n (+ left-size 1)))) 
            (let ((this-entry (car non-left-elts)) 
                  (right-result (partial-tree (cdr non-left-elts) 
                                              right-size))) 
              (let ((right-tree (car right-result)) 
                    (remaining-elts (cdr right-result))) 
                (cons (make-tree this-entry left-tree right-tree) 
                      remaining-elts))))))))

;; determine the pivot: the middle "this-entry". for left side - run recursive partial-tree with original elements set and N; for right-side - run recursive partial-tree with original set excluding lef-side and the pivot point and new N. In the end - make the tree.


; resulted tree, by the way, is not balanced, ehm?
;; > (list->tree '(1 3 5 7 9 11))
;; '(5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

;; the order of grown is (N)