#lang racket

(define input-list (file->lines "input"))
(define structure (map (λ (str) (string-split str)) (file->lines "structure")))
(define temp "")

(define do-it (λ (how-many from to) (for ([i (range 0 how-many)])
                                            (begin (set! temp (first (list-ref structure (- from 1))))
                                             (set! structure (list-set structure (- from 1) (cdr (list-ref structure (- from 1)))))
                                             (set! structure (list-set structure (- to 1) (cons temp (list-ref structure (- to 1))))))
                                          )))
(for ([str input-list])
    (do-it
     (string->number (list-ref (regexp-match #rx"([0-9]+)[ a-z]+([0-9]+)[ a-z]+([0-9]+)" str) 1))
     (string->number (list-ref (regexp-match #rx"([0-9]+)[ a-z]+([0-9]+)[ a-z]+([0-9]+)" str) 2))
     (string->number (list-ref (regexp-match #rx"([0-9]+)[ a-z]+([0-9]+)[ a-z]+([0-9]+)" str) 3))))
(print (foldr string-append "" (map (λ (aaa) (first aaa)) structure)))
