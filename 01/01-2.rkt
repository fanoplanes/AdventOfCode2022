#lang racket


(define arr (file->string "input"))

(define arr-of-arr (map (lambda (a) (regexp-split #rx"\n" a)) (regexp-split #rx"\n\n" (regexp-replace #rx"\n$" arr ""))))

(define summed-sorted (sort (map (lambda (a) (foldl + 0 a)) (map (lambda (a) (map (lambda (b) (string->number b)) a)) arr-of-arr)) >))

(display (+ (first summed-sorted) (second summed-sorted) (third summed-sorted)))
