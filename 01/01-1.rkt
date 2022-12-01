#lang racket

(define arr (file->string "input"))

(define arr-of-arr (map (lambda (a) (regexp-split #rx"\n" a)) (regexp-split #rx"\n\n" (regexp-replace #rx"\n$" arr ""))))

(define summed (map (lambda (a) (foldl + 0 a)) (map (lambda (a) (map (lambda (b) (string->number b)) a)) arr-of-arr)))

(display (car (sort summed >)))
