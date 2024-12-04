#lang racket

(define input-list (file->lines "input"))

(define ranged-list (map
                      (lambda (str)
                       (map (lambda (strng) (string-split strng "-"))
                      (string-split str ",")))
                    input-list))

(define counter 0)

(for-each (lambda (lst)
            (cond
              [(not
                (or
                 (< (string->number (cadar lst)) (string->number (caadr lst)))
                 (< (string->number (cadadr lst)) (string->number (caar lst)))))
               (set! counter (add1 counter))]))
          ranged-list)

(print counter)
