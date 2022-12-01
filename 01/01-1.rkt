#lang racket

(define input-string (file->string "input"))

(define list-of-list (map (lambda (a) (regexp-split #rx"\n" a)) (regexp-split #rx"\n\n" (regexp-replace #rx"\n$" input-string ""))))

(define summed (map (lambda (a) (foldl + 0 a)) (map (lambda (a) (map (lambda (b) (string->number b)) a)) list-of-list)))

(display (car (sort summed >)))
