#lang racket

(define input-string (file->string "input"))

(define split (string-split input-string))

(define halved (map (lambda (str) (list
                                   (substring str 0 (/ (string-length str) 2))
                                   (substring str (/ (string-length str) 2) (string-length str)))) split))

(define halved-list (map (lambda (stri) (map (lambda (strng) (string->list strng)) stri)) halved))

(define common (map (lambda (hlvd) (car (set-intersect
                                         (first hlvd)
                                         (second hlvd)))) halved-list))

(define value (lambda (character) (cond
                                    [(char-upper-case? character) (- (char->integer character) 38)]
                                    [(char-lower-case? character) (- (char->integer character) 96)])))

(foldl + 0 (map (lambda (character) (value character)) common))
