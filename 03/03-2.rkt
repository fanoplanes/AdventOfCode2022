#lang racket

(define input-list (file->list "input2"))

(define split-list (sequence->list (in-slice 3 input-list)))

(define common (map (lambda (hlvd) (car (set-intersect
                                         (string->list (~a (first hlvd)))
                                         (string->list (~a (second hlvd)))
                                         (string->list (~a (third hlvd)))))) split-list))

(define value (lambda (character) (cond
                                    [(char-upper-case? character) (- (char->integer character) 38)]
                                    [(char-lower-case? character) (- (char->integer character) 96)])))

(foldl + 0 (map (lambda (character) (value character)) common))
