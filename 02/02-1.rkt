#lang racket

(define input-string (file->string "input"))

(define list-of-list (map (lambda (a) (regexp-split #rx" " a)) (regexp-split #rx"\n" (regexp-replace #rx"\n$" input-string ""))))

(define won? (lambda (Arr) (cond
                              [(or
                                (and (string=? (first Arr) "A") (string=? (second Arr) "Y"))
                                (and (string=? (first Arr) "B") (string=? (second Arr) "Z"))
                                (and (string=? (first Arr) "C") (string=? (second Arr) "X"))) 6]
                              [(or
                                (and (string=? (first Arr) "A") (string=? (second Arr) "X"))
                                (and (string=? (first Arr) "B") (string=? (second Arr) "Y"))
                                (and (string=? (first Arr) "C") (string=? (second Arr) "Z"))) 3]
                              [else 0])))

(define value (lambda (Brr) (cond
                              [(string=? (cadr Brr) "X") 1]
                              [(string=? (cadr Brr) "Y") 2]
                              [(string=? (cadr Brr) "Z") 3])))

(define score (lambda (Crr) (+ (won? Crr) (value Crr))))
(foldl + 0 (map (lambda (Drr) (score Drr)) list-of-list))
