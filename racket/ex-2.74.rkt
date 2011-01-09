#lang racket
; a
(define (get-record name file-name)
  (let ((read-op (get 'record (division-type file-name))))
    (read-op file-name)))

; b
(define (get-salary employee)
  (let ((read-op (get 'salary (division-type employee))))
    (read-op employee)))

; c
(define (find-employee-record name files)
  (if (null? files) false
      (let ((current-file (car files))
            (rest-of-files (cdr files)))
        (let ((record (get-record name current-file)))
          (if (= false record) record
              (find-employee-record name rest-of-files))))))
  
; d
; just add new mapping to the table for data driven dispatching
    
  