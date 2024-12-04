#lang racket

(define input-list (file->lines "input"))
(define structure (map (lambda (str) (string-split str)) (file->lines "structure")))
(define temp empty)

(define do-it (lambda (how-many from to) (begin (set! temp (take (list-ref structure (- from 1)) how-many))
                                                (set! structure (list-set structure (- from 1) (list-tail (list-ref structure (- from 1)) how-many)))
                                                (set! structure (list-set structure (- to 1) (append temp (list-ref structure (- to 1))))))
                                          ))
(for ([str input-list])
    (do-it
     (string->number (list-ref (regexp-match #rx"([0-9]+)[ a-z]+([0-9]+)[ a-z]+([0-9]+)" str) 1))
     (string->number (list-ref (regexp-match #rx"([0-9]+)[ a-z]+([0-9]+)[ a-z]+([0-9]+)" str) 2))
     (string->number (list-ref (regexp-match #rx"([0-9]+)[ a-z]+([0-9]+)[ a-z]+([0-9]+)" str) 3))))
(print (foldr string-append "" (map (lambda (aaa) (first aaa)) structure)))
