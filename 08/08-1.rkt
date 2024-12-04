#lang racket

(define input (map (lambda (lst) (map (lambda (x) (- (char->integer x) 48)) lst)) (map (lambda (str) (string->list str)) (file->lines "input"))))

(define height (length input))
(define width (length (first input)))
(define current 0)

(define (look-left x y) (cond
                            [(= y 0) #t]
                            [(and (> current (list-ref (list-ref input x) (- y 1))) (look-left x (- y 1))) #t]
                            [else #f]))
(define (look-right x y) (cond
                            [(= y (sub1 width)) #t]
                            [(and (> current (list-ref (list-ref input x) (+ y 1))) (look-right x (+ y 1))) #t]
                            [else #f]))
(define (look-up x y) (cond
                            [(= x 0) #t]
                            [(and (> current (list-ref (list-ref input (- x 1)) y)) (look-up (- x 1) y)) #t]
                            [else #f]))
(define (look-down x y) (cond
                            [(= x (sub1 height)) #t]
                            [(and (> current (list-ref (list-ref input (+ x 1)) y)) (look-down (+ x 1) y)) #t]
                            [else #f]))

(define cumul 0)

(for ([i (in-range height)])
  (for ([j (in-range width)])
       (begin (set! current (list-ref (list-ref input i) j))
        (cond [(or (look-left i j) (look-right i j) (look-up i j) (look-down i j)) (set! cumul (add1 cumul))]))))

(print cumul)
