#lang racket

(define input-list (file->list "input2"))

(define (split-by lst n)
   (if (not (empty? lst))
       (cons (take lst n) (split-by (drop lst n) n))
       '() ))

(define split-list (split-by input-list 3))

(define common (map (lambda (hlvd) (car (set-intersect (string->list (~a (first hlvd))) (string->list (~a (second hlvd))) (string->list (~a (third hlvd)))))) split-list))

(define value (lambda (character) (cond
                                    [(char-upper-case? character) (- (char->integer character) 38)]
                                    [(char-lower-case? character) (- (char->integer character) 96)])))

(foldl + 0 (map (lambda (character) (value character)) common))
