#lang racket

(define input-string (file->string "input"))

(define list-of-list (map (lambda (a) (regexp-split #rx" " a)) (regexp-split #rx"\n" (regexp-replace #rx"\n$" input-string ""))))

(define value (lambda (Arr) (cond
                              [(or
                                (and (string=? (first Arr) "A") (string=? (second Arr) "Y"))
                                (and (string=? (first Arr) "B") (string=? (second Arr) "X"))
                                (and (string=? (first Arr) "C") (string=? (second Arr) "Z"))) 1]
                              [(or
                                (and (string=? (first Arr) "A") (string=? (second Arr) "Z"))
                                (and (string=? (first Arr) "B") (string=? (second Arr) "Y"))
                                (and (string=? (first Arr) "C") (string=? (second Arr) "X"))) 2]
                              [(or
                                (and (string=? (first Arr) "A") (string=? (second Arr) "X"))
                                (and (string=? (first Arr) "B") (string=? (second Arr) "Z"))
                                (and (string=? (first Arr) "C") (string=? (second Arr) "Y"))) 3])))

(define won? (lambda (Brr) (cond
                              [(string=? (cadr Brr) "X") 0]
                              [(string=? (cadr Brr) "Y") 3]
                              [(string=? (cadr Brr) "Z") 6])))

(define score (lambda (Crr) (+ (won? Crr) (value Crr))))
(foldl + 0 (map (lambda (Drr) (score Drr)) list-of-list))
