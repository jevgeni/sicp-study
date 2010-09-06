#lang racket

"non-working version:"
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (sqr (car things))
                    answer))))
  (iter items null))

(square-list (list 1 2 3 4))
'(1 4 9 16)

; reverse is because the first element in the list gets cons'ed to the list first, resulting being in the end of the list.
; reversed order of (cons (sqr (car things)) answer) like (cons answer (sqr (car things))) doesn't work either: '((((() . 1) . 4) . 9) . 16).
; it is because because of the cons nature. To form a one-level list, the first argument must be non-list and the second must be a list. In our case
; the first argument is the list and the second argument is a number, which results a lists in list. 
;
; To fix this, use "append" to join two lists and "list" to wrap the answer into a list:
(define (square-list2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (append answer 
                      (list (sqr (car things)))))))
  (iter items null))
"fixed version:"
(square-list2 (list 1 2 3 4))
'(1 4 9 16)